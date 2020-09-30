require 'rails_helper'
require 'pry-byebug'

RSpec.describe 'Product', type: :model do
  context 'creating a product' do  # (almost) plain English
    before :all do
      @product = create(:product)
    end
    it 'Save a valid Product' do
      expect(Product.all.size).to equal 1
    end
    it 'A product Belongs to a Category' do
      expect(@product.category).to be_an_instance_of Category
    end
    it 'A product Belongs to a Package' do
      expect(@product.package).to be_an_instance_of Package
    end
    it 'A product Belongs to a Store' do
      expect(@product.store).to be_an_instance_of Store
    end
    it 'A product Belongs to a Merchant' do
      expect(@product.merchant).to be_an_instance_of Merchant
    end
    it 'Product Merchant is the Store Owner' do
      expect(@product.merchant == @product.store.merchant).to be true
    end
  end

  context 'Packages' do
    it 'If sold by box, there must be a weight' do
      box = create(:box)
      product = build(:product, package: box)
      product.valid?
      expect(product.errors.keys).to include(:pack_weight)
    end
    it 'If sold by jar, there must be a weight' do
      box = create(:jar)
      product = build(:product, package: box)
      product.valid?
      expect(product.errors.keys).to include(:pack_weight)
    end
    it 'If sold by piece, there must be a weight' do
      box = create(:piece)
      product = build(:product, package: box)
      product.valid?
      expect(product.errors.keys).to include(:pack_weight)
    end
    it 'If there must be a weight, the weight should be bigger than 0' do
      box = create(:piece)
      product = build(:product, package: box, pack_weight: 0)
      product.valid?
      expect(product.errors.keys).to include(:pack_weight)
    end
  end
  context 'Prices' do
    before :each do
      @product = build(:product, price_cents: 100)
    end
    it 'Discounted price should be less than normal price' do
      @product.discounted_price_cents = 110
      @product.valid?
      expect(@product.errors.keys).to include(:discounted_price_cents)
    end
    it 'The discounted price cant be equal than the initial price' do
      @product.discounted_price_cents = 100
      @product.valid?
      expect(@product.errors.keys).to include(:discounted_price_cents)
    end
    it 'Method on Sale, return true only if the product has a discount' do
      @product.discounted_price_cents = 50
      expect(@product.on_sale?).to equal true
    end
  end
  context 'Validations'do
    it 'Sku is unique per store' do
      product_a = create(:product)
      product_b = build(:product, store: product_a.store, sku:product_a.sku )
      product_b.valid?
      expect(product_b.errors.keys).to include(:sku)
    end
  end
end
