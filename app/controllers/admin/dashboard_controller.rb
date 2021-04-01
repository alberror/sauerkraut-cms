class Admin::DashboardController < Admin::AdminController
  layout 'admin'
  
  def admin
    @posts = Post.all
    authorize @posts
  end
end
