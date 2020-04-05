class StoresController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @stores = policy_scope(Store)
    if params[:query].present?
      @stores = @stores.near(params[:query], 5, {order: ""})
      session[:place_query] = params[:query]
    end
    session[:stores] = @stores.pluck(:id)
    @categories = Category.joins(products: :store).select(:id,:name).where(products: {store_id: @stores.pluck(:id) }).distinct
    @markers = @stores.map do |store|
      {
        lat: store.latitude,
        lng: store.longitude,
        storeId: store.id
      }
    end
  end

  def filter_categories
    authorize Store
    @stores = Store.where(id: session[:stores])
    if params[:categories]
      @stores = @stores.joins(products: :category).where(categories: {id: params[:categories] }).distinct
    end
    @markers = @stores.map do |store|
      {
        lat: store.latitude,
        lng: store.longitude,
        storeId: store.id
      }
    end
  end

  def show
    @store = Store.find(params[:id])
    authorize @store
    @products = @store.available_products
  end
end
