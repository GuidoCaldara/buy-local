class CartProductsController < ApplicationController
  before_action :authenticate_user!
  def new
    @product = Product.find(params[:product_id])
    @cart_product = CartProduct.new
  end

  def create
    @product = Product.find(params[:product_id])
    @cart = Cart.find_or_create_by(user: current_user, completed: false, store: @product.store)
    @cart_product = CartProduct.find_or_initialize_by(product: @product, cart: @cart)
    @cart_product.quantity += (params[:cart_product][:quantity]).to_i
    @cart_product.save
  end

  def add
    @cart_product = CartProduct.find(params[:id])
    @cart_product.quantity += 1
    @cart_product.save
  end

  def remove
    @cart_product = CartProduct.find(params[:id])
    @cart_product.quantity -= 1 if @cart_product.quantity > 0
    @cart_product.save
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:quantity)
  end
end
