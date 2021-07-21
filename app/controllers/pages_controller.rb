class PagesController < ApplicationController
  skip_after_action :verify_authorized

  def home
    @projects = Project.published
  end

  def contact
    @mail = "parents@collectifberanger.paris"
  end
end
