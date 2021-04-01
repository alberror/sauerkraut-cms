class Admin::PostPolicy < ApplicationPolicy
  def home?
    true
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    true
  end

  def edit?
    update?
  end

  def destroy?
    true
  end

  def publish?
    true
  end

  def unpublish?
    true
  end
end