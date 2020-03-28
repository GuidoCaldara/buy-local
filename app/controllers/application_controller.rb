class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :merchant_controller


  def merchant_controller
    current_merchant
  end
end
