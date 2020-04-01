class CartProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user && user.class == User
  end

  def add?
    record.cart.user == user && record.cart.completed == false
  end

  def remove?
    add?
  end

  def destroy?
    add?
  end
end
