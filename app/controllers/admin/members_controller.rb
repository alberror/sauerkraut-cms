class Admin::MembersController < Admin::AdminController
  before_action :set_member, only: %i[ show edit update destroy ]
  layout "admin"

  def index
    where = {}
    orders = {
      name_asc: "last_name asc",
      name_desc: "last_name desc",
    }

    where[:status] = params[:status] if params[:status].present?
    order = params[:order].present? ? orders[params[:order].to_sym] : orders[:date_desc]
    @members = Member.where(where).order(order)
    authorize @members
  end

  def show
  end

  def new
    @member = Member.new
    authorize @member
  end

  def edit
  end

  def create
    @member = Member.new(member_params)
    authorize @member

    if @member.save
      redirect_to admin_member_path(@member)
    else
      raise
      render :new
    end
  end

  def update
    if @member.update(member_params)
      redirect_to admin_member_path(@member)
    else
      render :edit
      flash[:alert] = "Erreur dans la publication de l'article"
    end
  end

  def destroy
    @member.destroy
    redirect_to admin_members_path
  end

  private
    def set_member
      @member = Member.find(params[:id])
      authorize @member
    end

    def member_params
      params.require(:member).permit(:first_name, :last_name, :active, :email, :phone)
    end
end
