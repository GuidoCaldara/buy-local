class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def create
    @cart = Cart.find(params[:cart_id])
    @order = Order.find_or_create_by(cart: @cart)
    redirect_to @order
  end

  def delivery_info
  end

  def order_params
    params.require(:order)
  end
end
