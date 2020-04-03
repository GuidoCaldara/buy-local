class Merchant::ProductsController < ApplicationController
  before_action :authenticate_merchant!

  def index
    @products = policy_scope(Product)
    if params[:query].present?
      @products = @products.product_search(params[:query])
    end
    if params[:categories].present?
      @products = @products.where(category: params[:categories])
    end
  end


  def merchant_products_list
    authorize Product
    @products = current_merchant.products
    @categories = current_merchant.categories.uniq
  end

  def show
    @product = Product.find(params[:id])
    authorize @product
  end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    @product.store = current_merchant.store
    authorize @product
    @product.save
    respond_to do |format|
      format.html { redirect_to root_path  }
      format.js
    end
  end


  def edit
    @product = Product.find(params[:id])
    authorize @product
  end

  def update
    @product = Product.find(params[:id])
    authorize @product
    @product.update(product_params)
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
  end


  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :sku, :sold_by, :discounted_price, :category_id, :available, :pack_weight, :photo)
  end

end
