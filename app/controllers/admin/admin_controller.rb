class Admin::AdminController < ApplicationController
  before_action :require_admin

  private

  def require_admin
    unless current_user && current_user.admin?
      redirect_to root_path, notice: "Vous n'avez pas les autorisations requises pour cette destination"
    end
  end
end
