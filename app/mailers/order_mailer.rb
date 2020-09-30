class OrderMailer < ApplicationMailer
  add_template_helper(ProductsHelper)
  add_template_helper(StoresHelper)
  add_template_helper(CartsHelper)
  before_action :add_inline_attachment!
  default :from => 'any_from_address@example.com'

# send a signup email to the user, pass in the user object that   contains the user's email address
  def confirm_payment(order)
    @order = order
    @user = order.user
    @products = order.cart_products
    mail( :to => @user.email,
    :subject => "BuyLocal - Conferma pagamento ordine - #{@order.number}" )
  end

  def notify_merchant(order)
    @order = order
    @products = order.cart_products
    mail( :to => @order.merchant.email,
    :subject => "BuyLocal - Hai ricevuto un nuovo ordine - #{@order.number}" )
  end

  def add_inline_attachment!
    attachments.inline['truck.svg'] = File.read("#{Rails.root}/app/assets/images/delivery-truck.svg")
  end

end
