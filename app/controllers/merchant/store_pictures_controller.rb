class Merchant::StorePicturesController < ApplicationController
  before_action :authenticate_merchant!
  def create
    @store = Store.find(params[:store_id])
    @store_picture = StorePicture.new(store_picture_params)
    @store_picture.store = @store
    authorize @store_picture
    @store_picture.save
    @pictures = @store.store_pictures
    respond_to do |format|
      format.js { render action: 'photos.js.erb'}
    end
  end

  def store_picture_params
    params.require(:store_picture).permit(:picture)
  end
end
