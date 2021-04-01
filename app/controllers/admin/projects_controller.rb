class Admin::ProjectsController < Admin::AdminController
  before_action :set_project, only: %i[ show edit update destroy ]
  before_action :set_project_for_status_change, only: %i[ publish unpublish ]
  layout "admin"

  def index
    where = {}
    where[:status] = params[:status] if params[:status].present?
    order = params[:order].present? ? [params[:order].split("_")[0].to_sym, params[:order].split("_")[1].to_sym] : [:client, :asc]

    @projects = Project.where(where).order(order[0] => order[1])
    authorize @projects
  end

  def show
  end

  def new
    @project = Project.new
    authorize @project
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
    authorize @project
    
    if @project.save
      redirect_to admin_project_path(@project)
    else
      render :new
    end
  end

  def update
    if @project.update(project_params)
      redirect_to admin_project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to admin_projects_path
  end

  def publish
    if @project.update(status: "published")
      flash[:notice] = "Votre projet a bien été publié"
      redirect_back(fallback_location: admin_projects_path)
    else
      flash[:error] = "Erreur dans la publication du projet"
    end
  end

  def unpublish
    if @project.update(status: "unpublished")
      flash[:notice] = "Votre projet a bien été publié"
      redirect_back(fallback_location: admin_projects_path)
    else
      flash[:error] = "Erreur dans la publication du projet"
    end
  end

  private
    def set_project
      @project = Project.find(params[:id])
      authorize @project
    end

    def set_project_for_status_change
      @project = Project.find(params[:project_id])
      authorize @project
    end

    def project_params
      params.require(:project).permit(:title, :client, :partner, :summary, :thumbnail)
    end
end
