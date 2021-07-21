class Admin::CommentsController < ApplicationController
  before_action :require_admin
  before_action :set_comment, only: %i[ show edit update destroy ]
  layout "admin"

  def index
    where = {}
    orders = {
      title_asc: "title asc",
      title_desc: "title desc",
      status_asc: "status asc",
      status_desc: "status desc",
      date_asc: "comment.created_at asc",
      date_desc: "comment.created_at desc",
      views_asc: "COUNT(comment_data.id) asc",
      views_desc: "COUNT(comment_data.id) desc"
    }

    where[:status] = params[:status] if params[:status].present?
    order = params[:order].present? ? orders[params[:order].to_sym] : orders[:date_asc]
    @comments = Comment.where(where).order(order).map do |c|
      c.upvotes = c.comment_data.where(datum_type: "upvotes").count
      c.downvotes = c.comment_data.where(datum_type: "downvotes").count
    end
    authorize @comments
  end

  def show
  end

  private

  def require_admin
    unless current_user && current_user.admin?
      redirect_to new_user_session_path, notice: t("errors.unauthorized_location")
    end
  end

  def set_comment
      @comment = Comment.find(params[:id])
      authorize @comment
    end
end
