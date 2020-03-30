class UsersController < ApplicationController
  def dashboard
    @user = current_user
    @orders = current_user.orders
    @completed_orders = @orders.where(status: "completed")
    @ongoing_orders = @orders.where(status: "paied")
    @pending_orders = @orders.where(status: "pending")
  end
end
