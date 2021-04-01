class OrderPolicy < ApplicationPolicy
  def index?
    @user.admin? || @order.user == @user
  end

  def show?
    @user.admin? || @order.user == @user
  end

  def create?
    @user.user?
  end

  def new?
    create?
  end

  def update?
    @user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    @user.admin?
  end

  private

  def order
    record
  end
end