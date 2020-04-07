class Order < ApplicationRecord

  STATUSES = { 'pending' => 'Order placed',
               'paid' => 'A change has been made to the order',
               'delivered' => 'The order has been shipped',
               'completed' => 'The order has been archived' }
  monetize :cart_amount_cents
  monetize :delivery_fee_cents
  monetize :total_amount_cents
  belongs_to :cart
  has_many :cart_products, through: :cart
  has_one :user, through: :cart
  has_one :store, through: :cart
  has_one :merchant, through: :store
  has_one :delivery_info, dependent: :destroy
  before_validation :generate_order_number, on: :create
  before_save :calculate_amounts
  #before_validation :set_total_price
  after_update :send_confirmation_emails
  validates :status, presence: true, inclusion: { in: STATUSES.keys }
  validates :number, presence: true
  validate :cart_id, uniqueness: true


  def send_confirmation_emails
    byebug
    if self.previous_changes["status"] && status == 'paid'

       OrderMailer.confirm_payment(self).deliver
       #MerchantNotifierMailer.new_order_received(self).deliver
    end
  end

#  def set_total_price
 #   self.cart_amount_cents = self.cart.products_total_price
  #end

  def calculate_amounts
    cart_price = self.cart.products_total_price
    store = self.store
    free_delivery_threshold_cents = store.free_delivery_threshold_cents
    self.cart_amount_cents = cart_price
    if (free_delivery_threshold_cents != 0)
      if (cart_price >= free_delivery_threshold_cents)
        self.delivery_fee_cents = 0
      else
        self.delivery_fee_cents = store.delivery_fee_cents
      end
    end
    self.total_amount_cents = self.cart_amount_cents + self.delivery_fee_cents
  end



  def generate_order_number
    self.number = loop do
      random_token = ('A'..'Z').to_a.sample(4).join
      2.times { random_token.insert(rand(0..4), rand(0..9).to_s) }
      break random_token if Order.where(number: random_token)
    end
  end
end
