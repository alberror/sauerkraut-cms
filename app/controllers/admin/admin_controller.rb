class Admin::AdminController < ApplicationController
  before_action :require_admin

  def policy_scope(scope)
    super([:admin, scope])
  end

  def authorize(record, query = nil)
    super([:admin, record], query)
  end

  private

  def require_admin
    unless current_user && current_user.admin?
      redirect_to root_path, notice: "Vous n'avez pas les autorisations requises pour cette destination"
    end
  end
end
