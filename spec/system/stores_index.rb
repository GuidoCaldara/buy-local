require 'rails_helper'
require 'pry-byebug'
RSpec.describe 'Stores Index Page', type: :system do
  before :all do
    byebug
    @store_a = create(:store, merchant: @merchant)
    @store_b = create(:store, merchant: @merchant)
    @store_c = create(:store, merchant: @merchant)
    @store_d = create(:store, merchant: @merchant)
    @merchant = create(:merchant)
  end
  describe 'Search from Home gives me a list of stores near me' do
    it "Display restaurants Near by If I search from the index page" do
      visit root_path
      fill_in 'banner-search-form-input', with: "Albino, Bg, Italy"
      find('.ap-dataset-places .ap-suggestions').click
      expect(page).to have_text(@store.name)
      #fill_in 'Email', with: user.email
      #fill_in 'Password', with: 'password'
      #click_on 'Sign in'
      #expect(page).to have_current_path(root_path)
    end
    it "Display a message containing 'nessun negozio' if there are no results" do
      visit root_path
      fill_in 'banner-search-form-input', with: "Torino, TO, Italy"
      all('.ap-suggestions div')[0].click
      expect(page).to have_text('nessun negozio')
    end
    it "Store the location query in the navbar form" do
      visit root_path
      fill_in 'banner-search-form-input', with: "Albino, Bg, Italy"
      location_box = all('.ap-suggestions div')[0]
      location = location_box.text
      location_box.click
      form_input = find('#navbar-search-form input').value
      byebug
      expect(form_input.split(',')).to include(location.split.first)
    end
#navbar-search-form
  end
end

