class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :carts
  has_many :cart_products, through: :carts
  has_many :orders, through: :carts
  has_many :delivery_infos, through: :orders
  after_create :send_welcome_email

  def send_welcome_email
    UserNotifierMailer.send_welcome_email(self).deliver
  end


  def active_carts
    self.carts.where(completed: false)
  end
end
