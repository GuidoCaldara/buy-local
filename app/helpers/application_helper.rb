module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
   @devise_mapping ||= Devise.mappings[:user]
  end

  def product_in_cart(user)
    CartProduct.joins(:cart).where("carts.user_id = ? AND carts.completed = ?", user, false).sum(:quantity)
  end

  def total_price_in_cart(user)
    price = CartProduct.joins(:cart).select(:price_cents).where(carts: {user_id: user, completed: false}).sum(:price_cents)
    return '0.00' if price.zero?
    #return "#{price.to_s}.00" if price.to_s.length == 1 || price.to_s.length == 2
    price.to_s.insert(-3,".")
  end

  def prettify_price(price_cents)
    price = (price_cents).to_s
    return "0.00" if price == "0"
    price.insert(-3, ".")
    return price
  end

  def short_address(store)
    "#{store.street} #{store.street_number}, #{store.city}"
  end

end
