class PagesController < ApplicationController
  skip_after_action :verify_authorized

  def home
    @projects = Project.all
  end
end