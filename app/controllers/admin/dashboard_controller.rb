class Admin::DashboardController < Admin::AdminController
  layout 'admin'
  
  def home
    @projects = Project.all
    authorize @projects
  end
end
