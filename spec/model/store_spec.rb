require 'rails_helper'

RSpec.describe 'Store', type: :model do

  context 'Creating a store' do  # (almost) plain English
    it 'Saves a valid store' do
      @store = build(:store)
      @store.valid?
      expect(@store.errors.keys).to be_empty
    end
    it 'Not valid if the store has no name' do
      store = build(:store, name: '')
      store.valid?
      expect(store.errors).to have_key(:name)
    end
    it 'Delivery Price Should Be less than the free_delivery_threshold' do
      store = build(:store, delivery_fee_cents: 500, free_delivery_threshold_cents:400)
      store.valid?
      expect(store.errors).to have_key(:free_delivery_threshold_cents)
    end
    it 'If free delivery threshold applied, delivery cant be free' do
      store = build(:store, delivery_fee_cents: 0, free_delivery_threshold_cents:400)
      store.valid?
      expect(store.errors).to have_key(:delivery_fee_cents)
    end
    it 'Delivery Time Should be included in [24,24,72,96]' do
      [24,48,72,96].each do |n|
        store = build(:store, delivery_time: n)
        store.valid?
        expect(store.errors).to be_empty
      end
      store = build(:store, delivery_time: 30)
      store.valid?
      expect(store.errors).to have_key(:delivery_time)
    end
  end
  describe "Address and geolocalization" do
    before :all do
      @store = create(:store)
    end
    it "Store it's not valid without lat or lng" do
      @store.latitude = nil
      @store.valid?
      expect(@store.errors).to have_key(:address)
    end
  end

  describe "Association" do
    before :all do
      @store = create(:store, :with_products)
    end
    it 'Has many products' do
      expect(@store.products.any?).to be true
      expect(@store.products.sample).to be_an_instance_of Product
    end
    it 'Belongs To a Merchant' do
      expect(@store.merchant).to be_an_instance_of Merchant
    end
    it 'Has Many Categories' do
      expect(@store.categories.all.sample).to be_an_instance_of Category
    end
  end
end
