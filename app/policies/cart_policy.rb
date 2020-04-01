class CartPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user).where(completed: false)
    end
  end

  def show?
    record.user == user && record.completed == false
  end

  def edit?
    record.user == user && record.completed == false
  end

  def destroy?
    record.user == user && record.completed == false
  end
end
