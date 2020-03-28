class Merchant::StoresController < ApplicationController
  before_action :authenticate_merchant!

  def show
    @store = current_merchant.store
  end

  def update
  end

  def destroy
  end
end
