require 'rails_helper'

RSpec.describe 'Home Page', type: :system do
  describe 'Let user access the homepage' do
    it "enables me to login" do
      visit root_path
      expect(page).to have_text("BuyLocal")
    end
    it "let me search for a place" do
      visit root_path
      fill_in 'banner-search-form-input', with: "Albino, Bg, Italy"
      find('.ap-dataset-places .ap-suggestions').click
      expect(page).to have_text("Filtra negozi in base ai prodotti")
    end

  end
end
