class Shop::StoresController < ApplicationController
  before_action :authenticate_shop!

  def show
    @store = current_shop.store
  end

  def update
  end

  def destroy
  end
end
