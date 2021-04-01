class Admin::UsersController < Admin::AdminController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :set_user_for_status_change, only: %i[ activate deactivate ]
  layout "admin"

  def index
    where = {}
    where[:status] = params[:status] if params[:status].present?
    order = params[:order].present? ? [params[:order].split("_")[0].to_sym, params[:order].split("_")[1].to_sym] : [:last_name, :asc]

    @users = User.where(where).order(order[0] => order[1])
    authorize @users
  end

  def show
  end

  def new
    @user = User.new
    authorize @user
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    authorize @user
    
    if @user.save
      redirect_to admin_user_path(@user)
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_Users_path
  end

  def activate
    if @user.update(status: "active")
      flash[:notice] = "L'utilisateur a bien été activé"
      redirect_back(fallback_location: admin_users_path)
    else
      flash[:error] = "Erreur dans l'activation de l'utilisateur"
    end
  end

  def deactivate
    if @user.update(status: "inactive")
      flash[:notice] = "L'utilisateur a bien été désactivé"
      redirect_back(fallback_location: admin_users_path)
    else
      flash[:error] = "Erreur dans l'inactivation de l'utilisateur"
    end
  end


  private
    def set_user
      @user = User.find(params[:id])
      authorize @user
    end

    def set_user_for_status_change
      @user = User.find(params[:user_id])
      authorize @user
    end

    def user_params
      params.require(:user).permit(:email)
    end
end
