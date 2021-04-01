class App::AppController < ApplicationController
  before_action :require_signed_in

  private

  def require_signed_in
    unless current_user && current_user.user?
      redirect_to root_path, notice: "Vous n'avez pas les autorisations requises pour cette destination"
    end
  end
end
