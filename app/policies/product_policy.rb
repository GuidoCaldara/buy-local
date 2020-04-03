class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      byebug
      scope.where(merchant: merchant)
    end
  end

  def merchant_products_list?
    user.class == Merchant
  end

  def create?
    user.class == Merchant
  end

  def update?
   record.merchant == user
  end

  def show?
    return true if user.class == User
  end
end
