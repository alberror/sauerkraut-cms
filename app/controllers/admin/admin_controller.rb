class Admin::AdminController < ApplicationController
  before_action :require_admin

  private

  def require_admin
    unless current_user && current_user.admin?
      redirect_to root_path, notice: t("errors.unauthorized_location")
    end
  end
end
