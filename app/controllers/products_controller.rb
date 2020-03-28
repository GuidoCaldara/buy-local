class ProductsController < ApplicationController
  def index
    @products = current_merchant.products
  end
end
