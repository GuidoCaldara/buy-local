class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :merchant_controller
  before_action :store_back_paths
  include Pundit
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?


  def merchant_controller
    current_merchant
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def after_sign_in_path_for(resource)
    if resource.class == User
      if Rails.application.routes.recognize_path(request.referer)[:controller].match(/devise/)
        stores_path
      else
        request.referer
      end
    else
      merchant_dashboard_path
    end
  end

  def pundit_user
    current_merchant || current_user
  end


def store_back_paths
  session[:back_path] ||= []
  session[:back_path] << request.referer
  session[:back_path].shift while session[:back_path].count > 5
end


end
