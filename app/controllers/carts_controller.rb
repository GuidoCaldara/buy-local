class CartsController < ApplicationController
  def index
    @carts = current_user.carts.where(completed: false)
  end

  def edit
    @cart = Cart.find(params[:id])
    @cart.update(completed: false)
    redirect_to carts_path
  end

  def show
  end
end
