class OrderPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      user.store.orders
    end
  end


  def create?
    record.cart.user_id == user.id && record.cart.completed == false && Order.find_by(cart: record.cart).nil?
  end

  def edit?
    record.cart.user_id == user.id && record.cart.completed == false
  end

  def destroy?
    record.cart.user_id == user.id && record.status == 'pending'
  end

  def show?
    record.user == user
  end

  def can_be_payed?
    record.status == 'pending' && record.checkout_session_id.present? && record.user.id == user.id && DeliveryInfo.find_by(order: record)
  end

  def merchant_show?
    record.store == user.store
  end


  def filter_orders?
    true
  end
end
