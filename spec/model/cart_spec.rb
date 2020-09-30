require 'rails_helper'
require 'pry-byebug'


RSpec.describe 'Cart', type: :model do

  # before :all do
  #   @merchant = create(:merchant)
  #   @store = create(:store, :store_a, merchant: @merchant)
  #   @user = create(:user)
  # end

  # context 'Cart' do  # (almost) plain English
  #   it 'Create a cart' do
  #     cart = create(:cart, user: @user, store: @store)
  #     expect(Cart.all.count).to equal 1
  #   end
  # end

  context 'User can have just one active cart with the same store' do
    # it 'Cant create two active carts' do
    #   cart_a = create(:cart, user: @user, store: @store)
    #   cart_b = build(:cart, user: @user, store: @store)
    #   cart_b.valid?
    #   expect(cart_b.errors).to have_key(:user_id)
    # end

    # it 'Can create two carts if one is completed' do
    #   completed_cart = create(:cart, user: @user, store: @store, completed: true)
    #   cart = build(:cart, user: @user, store: @store)
    #   expect(cart).to be_valid
    # end
  context 'Cart total price its the sum of the cart_products prices' do
    it 'Calculate the correct sum' do
       user = create(:user)
       store = create(:store)
       pasta = create(:product, :pasta, store: store)
       ham = create(:product, :ham, store: store)
       cart = create(:cart, user: user, store: store)
       byebug
       cart_product = create(:cart_product, cart: cart, product: pasta )
       byebug
    end
  end
end
end
