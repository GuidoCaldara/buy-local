class MerchantsController < ApplicationController
  def dashboard
    authorize Merchant
    @products = current_merchant.products
    @categories = current_merchant.categories.uniq
    @orders = policy_scope(Order).where(status: 'paid')
  end
end
