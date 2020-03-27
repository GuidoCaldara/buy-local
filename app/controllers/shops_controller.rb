class ShopsController < ApplicationController
  def dashboard
    @products = current_shop.products
    @categories = current_shop.categories.uniq
  end
end
