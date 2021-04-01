class Blog::PostsController < ApplicationController
  before_action :set_post, only: %i[ show ]

  def index
    @posts = Post.all
    authorize @posts
  end

  def show
  end

  private
    def set_post
      @post = Post.find(params[:id])
      authorize @post
    end
end
