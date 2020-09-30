class Merchant::ProductsController < ApplicationController
  before_action :authenticate_merchant!
  before_action :set_product, only: [:show, :edit, :update, :destroy]

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
    @products = current_merchant.store.products
    @categories = current_merchant.categories.uniq
  end

  def show
    authorize @product, :merchant_show?
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
    authorize @product
  end

  def update
    authorize @product
    @product.update(product_params)
  end

  def destroy
    @product.destroy
  end


  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :sku, :sold_by, :discounted_price, :category_id, :available, :pack_weight, :photo, :package_id)
  end

end
