class CommentPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    asked_by_admin?
  end

  def update?
    asked_by_admin?
  end

  def destroy?
    asked_by_admin?
  end

  def publish?
    asked_by_admin?
  end

  def unpublish?
    asked_by_admin?
  end

  private

  def post
    record
  end

  def asked_by_admin?
    user.present? && user.admin?
  end
end
