class StoresController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @stores = Store.all
    @markers = @stores.map do |store|
      {
        lat: store.latitude,
        lng: store.longitude
      }
    end

  end

  def show
    @store = Store.find(params[:id])
    @products = @store.products
  end
end
