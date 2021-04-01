class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show ]

  def index
    @projects = Project.all
    authorize @projects
  end

  def show
  end

  private
    def set_project
      @project = Project.find(params[:id])
      authorize @project
    end
end
