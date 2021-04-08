class Admin::PostsController < Admin::AdminController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :set_post_for_status_change, only: %i[ publish unpublish ]
  layout "admin"
  
  def index
    where = {}
    where[:status] = params[:status] if params[:status].present?
    order = params[:order].present? ? [params[:order].split("_")[0].to_sym, params[:order].split("_")[1].to_sym] : [:created_at, :asc]

    @posts = Post.where(where).order(order[0] => order[1])
    authorize @posts
  end

  def show
  end

  def new
    @post = Post.new
    authorize @post
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    authorize @post
    
    if @post.save
      redirect_to admin_post_path(@post)
    else
      raise
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to admin_post_path(@post)
    else
      render :edit
      flash[:alert] = "Erreur dans la publication de l'article"
    end
  end

  def destroy
    @post.destroy
    redirect_to admin_posts_path
  end

  def publish
    if @post.update(status: "published")
      flash[:notice] = "Votre article a bien été publié"
      redirect_back(fallback_location: admin_posts_path)
    else
      flash[:alert] = "Erreur dans la publication de l'article"
    end
  end

  def unpublish
    if @post.update(status: "unpublished")
      flash[:notice] = "Votre article a bien été publié"
      redirect_back(fallback_location: admin_posts_path)
    else
      flash[:alert] = "Erreur dans la publication de l'article"
    end
  end

  private
    def set_post
      @post = Post.friendly.find(params[:id])
      authorize @post
    end

    def set_post_for_status_change
      @post = Post.friendly.find(params[:post_id])
      authorize @post
    end

    def post_params
      params.require(:post).permit(:user_id, :title, :slug, :thumbnail, :summary, :body)
    end
end
