class Merchant::OrdersController < ApplicationController
  before_action :authenticate_merchant!

  def index
    @orders = policy_scope(Order).where(status: 'paid')
    @store = current_merchant.store
  end

  def show
    @order = Order.find(params[:id])
    authorize @order, :merchant_show?
  end

  def filter_orders
    @orders = policy_scope(Order).where(status: params[:q])
    authorize Order, :filter_orders?
  end

  def delivery
    @order = Order.find(params[:id])
    authorize @order, :merchant_show?
    @order.update(status: "delivered")
  end

  def destroy
  end
end
