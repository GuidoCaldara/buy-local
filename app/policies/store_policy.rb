class StorePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def filter_categories?
    true
  end

  def update?
    record == user.store
  end

  def merchant_show?
    record == user.store
  end
end
