class Merchant::OrdersController < ApplicationController
  before_action :authenticate_merchant!
  before_action :set_order, only: [:delivery, :show]

  def index
    @orders = policy_scope(Order).where(status: 'paid')
    @store = current_merchant.store
  end

  def show
    authorize @order, :merchant_show?
  end

  def filter_orders
    @orders = policy_scope(Order).where(status: params[:q])
    authorize Order, :filter_orders?
  end

  def delivery
    authorize @order, :merchant_show?
    @order.update(status: "delivered")
  end

  def destroy
  end

private

  def set_order
    @order = Order.find(params[:id])
  end
end
