require 'rails_helper'

RSpec.describe 'Merchant', type: :model do

  context 'Creating a Merchant' do  # (almost) plain English
    it 'Merchant is saved with Username and Password' do
      merchant = build(:merchant)
      expect(merchant).to respond_to :save!
    end
  end

  context 'Merchant Has a store'
    it 'Merchant has a store' do
      merchant = create(:merchant, :with_store)
      expect(merchant.store).to be_an_instance_of Store
    end
    it 'Merchant cant have more than one store' do
      merchant = create(:merchant, :with_store)
      store = build(:store, merchant: merchant)
      expect(store.errors.keys).to include(:merchant_id)
    end
end
