class DeliveryInfoPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    record.user == user && DeliveryInfo.find_by(order_id: record.order.id).nil?
  end

  def create?
    record.user == user && DeliveryInfo.find_by(order_id: record.order.id).nil?
  end

  def update?
    false
    #record.user == user && record.order.status == 'pending'
  end
end
