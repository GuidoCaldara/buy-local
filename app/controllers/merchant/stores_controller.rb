class Merchant::StoresController < ApplicationController
  before_action :authenticate_merchant!
  before_action :set_store, except: [:show]

  def show
    @store = current_merchant.store
    authorize @store, :merchant_show?
  end

  def edit
    authorize @store
  end

  def update
    @store.update(store_params)
    authorize @store
  end

  def delivery_policy
    authorize @store, :update?
  end

  def edit_delivery_policy
    authorize @store, :update?
  end

  def update_delivery_policy
    @store.update(store_params)
    authorize @store, :update?
  end

  def photos
    @pictures = @store.store_pictures
    authorize @store, :update?
  end

  private

  def set_store
    @store = Store.find(params[:id])
  end

  def store_params
    params.require(:store).permit(:name, :logo, :street, :zip_code, :city, :state, :description, :phone_number, :street_number, :delivery_fee, :free_delivery_threshold, :delivery_time  )
  end
end


