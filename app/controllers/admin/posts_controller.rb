class Admin::PostsController < Admin::AdminController
  before_action :set_post, only: %i[ show edit update destroy ]
  layout "admin"
  
  def index
    @posts = Post.all
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
      @post = Post.find(params[:id])
      authorize @post
    end

    def post_params
      params.require(:post).permit(:user_id, :title, :slug, :thumbnail, :summary, :body)
    end
end
