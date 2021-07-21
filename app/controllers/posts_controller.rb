class PostsController < ApplicationController
  before_action :set_post, only: %i[ show ]

  def index
    @posts = Post.published
    @most_read_posts = Post.left_joins(:post_data).group(:id).order("COUNT(post_data.id) desc").limit(5)
    @most_commented_posts = Post.left_joins(:comments).group(:id).order("COUNT(comments.id) desc").limit(5)
    authorize @posts
  end

  def show
    increment_datum(@post)
  end

  private
    def set_post
      @post = Post.friendly.find(params[:id])
      authorize @post
    end

    def increment_datum(post)
      datum = PostDatumService.new(post, request.remote_ip, current_user)
      datum.increment
    end
end
