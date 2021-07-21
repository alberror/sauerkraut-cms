class ProjectPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    asked_by_admin?
  end

  def new?
    create?
  end

  def update?
    asked_by_admin?
  end

  def edit?
    update?
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

  def project
    record
  end

  def asked_by_admin?
    user.present? && user.admin?
  end
end
