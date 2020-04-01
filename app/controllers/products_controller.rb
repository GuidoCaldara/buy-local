class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @products = @product.store.products.where.not(id: @product.id)
    authorize @product
  end
end
