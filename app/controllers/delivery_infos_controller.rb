class DeliveryInfosController < ApplicationController
  def new
    @last_info = current_user.delivery_infos.last || DeliveryInfo.new()
    @order = Order.find(params[:order_id])
    @delivery_info = DeliveryInfo.new(order: @order)
    authorize @delivery_info
  end


  def edit
    @delivery_info = DeliveryInfo.find(params[:id])
    @last_info = current_user.delivery_infos.last || DeliveryInfo.new()
    authorize @delivery_info
  end

  def update
    @delivery_info = DeliveryInfo.find(params[:id])
    authorize @delivery_info
    @delivery_info.update(delivery_info_params)
    if @delivery_info.save
      redirect_to new_order_payment_path(@delivery_info.order)
    else
      render :edit
    end
  end


  def create
    @order = Order.find(params[:order_id])
    @delivery_info = DeliveryInfo.new(delivery_info_params)
    @delivery_info.country = "Italia"
    @delivery_info.order = @order
    authorize @delivery_info
    if @delivery_info.save
      session = Stripe::Checkout::Session.create({
        payment_method_types: ['card'],
        line_items: order_summary(@order),
        payment_intent_data: {
          application_fee_amount: (@order.total_amount_cents * 0.1).round(0),
          transfer_data: {
            destination: @order.merchant.stripe_merchant_id,
          },
        },
        success_url: order_url(@order),
        cancel_url: order_url(@order),
      })
      @order.update(checkout_session_id: session.id)
      redirect_to new_order_payment_path(@order)
    else
      @last_info = @delivery_info || DeliveryInfo.new()
      render 'new'
    end
  end

  def order_summary(order)
    order.cart_products.map do |cart_product|
      {
        name: cart_product.product.name,
        amount: cart_product.product.price_cents,
        currency: 'eur',
        quantity: cart_product.quantity
      }
    end
  end

  def delivery_info_params
    params.require(:delivery_info).permit(:first_name, :last_name, :zip_code, :street, :city, :notes, :state, :email, :phone_number)
  end
end
