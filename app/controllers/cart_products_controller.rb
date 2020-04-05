class CartProductsController < ApplicationController
  before_action :authenticate_user!

  def new
    @product = Product.find(params[:product_id])
    authorize CartProduct
    @cart_product = CartProduct.new
  end

  def create
    @product = Product.find(params[:product_id])
    authorize CartProduct
    @cart = Cart.find_or_create_by(user: current_user, completed: false, store: @product.store)
    @cart_product = CartProduct.find_or_initialize_by(product: @product, cart: @cart)
    @cart_product.quantity += (params[:cart_product][:quantity]).to_i
    @cart_product.save
  end

  def add
    @cart_product = CartProduct.find(params[:id])
    authorize @cart_product
    @cart_product.quantity += 1
    @cart_product.save
    respond_to do |format|
      format.js { render action: 'edit-cart.js.erb'}
    end
  end

  def remove
    @cart_product = CartProduct.find(params[:id])
    authorize @cart_product
    if @cart_product.quantity > 0
      @cart_product.quantity -= 1
      @cart_product.save
      respond_to do |format|
        format.js { render action: 'edit-cart.js.erb'}
      end
    end
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    authorize @cart_product
    @cart_product.destroy
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:quantity)
  end
end
