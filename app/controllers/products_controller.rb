class ProductsController < ApplicationController
  def index
    @products = current_shop.products
  end
end
