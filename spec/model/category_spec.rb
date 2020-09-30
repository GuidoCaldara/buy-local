require 'rails_helper'
CATEGORIES = ["Insaccati", "Frutta", "Pane", "Verdura", "Formaggi", "Conserve", "Erbe", "Carne", "Pesce", "Pasta Fresca"]

RSpec.describe 'Category', type: :model do
  context 'Creating a Category' do  # (almost) plain English
    it 'Saves Category with name' do
      pasta_category = build(:pasta_category)
      expect(pasta_category).to respond_to :save!
    end
    it 'Category Name must be included in the pre-made list' do
      CATEGORIES.each do |c|
        category = Category.new(name: c )
        expect(category).to be_valid
      end
    end
  end
  it 'Not other names are allowed' do
    category = Category.new(name: 'ajaja' )
    expect(category).not_to be_valid
  end
end
