class CartsController < ApplicationController

  def index
    @carts = policy_scope(Cart)
  end

  def edit
    @cart = Cart.find(params[:id])
    authorize @cart
    @cart.order.destroy
    @cart.update(completed: false)
    redirect_to carts_path
  end

  def destroy
    @cart = Cart.find(params[:id])
    authorize @cart
    @cart.destroy
    redirect_to stores_path
  end

  def show
    @cart = Cart.find(params[:id])
    authorize @cart
  end
end
