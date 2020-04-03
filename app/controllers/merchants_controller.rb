class MerchantsController < ApplicationController
  def dashboard
    authorize Merchant
    @products = current_merchant.products
    @categories = current_merchant.categories.uniq
  end
end
