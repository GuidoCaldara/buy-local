class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    authorize @order
  end

  def create
    @cart = Cart.find(params[:cart_id])
    @order = Order.find_or_initialize_by(cart: @cart)
    authorize @order
    @order.save
    redirect_to @order
  end

  def edit
    @order = Order.find(params[:id])
    authorize @order
  end

  def destroy
    @order = Order.find(params[:id])
    authorize @order
    @order.destroy
    redirect_to stores_path
  end

  def order_params
    params.require(:order)
  end
end
