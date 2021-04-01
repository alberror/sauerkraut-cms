class UserPolicy < ApplicationPolicy
  def index?
    @user.admin?
  end

  def show?
    @user.admin? || @user = user
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    @user.admin? || @user = user
  end

  def edit?
    update?
  end

  def destroy?
    @user.admin? && @user != user
  end

  def activate?
    @user.admin? && @user != user
  end

  def deactivate?
    @user.admin? && @user != user
  end

  private

  def user
    record
  end
end