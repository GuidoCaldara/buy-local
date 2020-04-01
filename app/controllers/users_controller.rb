class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new_access_modal]
  def dashboard
    @user = current_user
    @orders = current_user.orders
    @completed_orders = @orders.where(status: "completed")
    @ongoing_orders = @orders.where(status: "paied")
    @pending_orders = @orders.where(status: "pending")
    authorize User
  end

  def new_access_modal
    authorize User
  end
end
