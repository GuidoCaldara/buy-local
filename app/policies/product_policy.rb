class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(store: user.store)
    end
  end

  def merchant_products_list?
    user.class == Merchant
  end


  def show?
    true
  end

  def merchant_show?
    record.merchant == user
  end

  def create?
    user.class == Merchant
  end

  def update?
    record.merchant == user
  end
end
