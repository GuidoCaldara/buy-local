class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if current_shop
      redirect_to shop_dashboard_path
    end
  end
end
