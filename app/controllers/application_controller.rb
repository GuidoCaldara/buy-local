class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :shop_controller


  def shop_controller
    current_shop
  end
end
