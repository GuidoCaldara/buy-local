class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if current_merchant
      redirect_to merchant_dashboard_path
    end
  end
end
