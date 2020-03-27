module ShopsHelper
  def generate_stripe_button
    stripe_url = "https://connect.stripe.com/express/oauth/authorize"
    redirect_uri = stripe_connect_url
    client_id = ENV["STRIPE_CLIENT_ID"]
    "#{stripe_url}?redirect_uri=#{redirect_uri}&client_id=#{client_id}"
  end
end
