class MerchantsController < ApplicationController
  def dashboard
    @products = current_merchant.products
    @categories = current_merchant.categories.uniq
  end
end
