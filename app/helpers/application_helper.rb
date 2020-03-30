module ApplicationHelper
  def product_in_cart(user)
    CartProduct.joins(:cart).where("carts.user_id = ? AND carts.completed = ?", user, false).sum(:quantity)
  end
  def total_price_in_cart(user)
    price = user.cart_products.sum(:price_cents)
    return '0.00' if price.zero?
    #return "#{price.to_s}.00" if price.to_s.length == 1 || price.to_s.length == 2
    price.to_s.insert(-3,".")
  end

  def current_price(product)
    if product.discounted_price != 0
      return product.discounted_price
    else
       return product.price
    end
  end

  def prettify_price(price_cents)
    price = (price_cents).to_s
    price.insert(-3, ".")
    return price
  end

  def short_address(store)
    "#{store.street} #{store.street_number}, #{store.city}"
  end

  def order_status(order)
    case order.status
    when "pending"
      return "In attesa di Pagamento"
    when "paied"
      return "Pagato. In consegna"
    when "completed"
      return "consegnato"
    end
  end
end
