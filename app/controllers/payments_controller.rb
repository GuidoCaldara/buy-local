class PaymentsController < ApplicationController
  def new
    @order = Order.find(params[:order_id])
    authorize @order, :can_be_payed?
  end

  def create
  end
end
