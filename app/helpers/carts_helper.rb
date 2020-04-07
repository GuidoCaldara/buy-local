module CartsHelper

  def free_delivery?(cart)
    return true if cart.store.delivery_fee_cents == 0
    return false if cart.store.free_delivery_threshold_cents == 0
    cart.products_total_price >= cart.store.free_delivery_threshold_cents
  end

  def partial_total_amount(cart)
    total = cart.products_total_price
    p cart.store.delivery_fee_cents
    if cart.store.free_delivery_threshold_cents == 0
      p 'a'
      total += cart.store.delivery_fee_cents
    end
    if cart.products_total_price < cart.store.free_delivery_threshold_cents
      p 'b'
      p total
      total += cart.store.delivery_fee_cents
      p total
    end
    total / 100
  end

  def reach_free_delivery?(cart)
    cart.products_total_price > cart.store.free_delivery_threshold_cents
  end

  def amount_to_free_delivery(cart)
    (cart.store.free_delivery_threshold_cents - cart.products_total_price) / 100
  end

  def stringify_delivery_day(cart)
    n = cart.store.delivery_time
    delivery = Time.now
    if delivery.hour > 12
      delivery += (n+1).day
    else
      return "domani"
    end
    "#{l(delivery, format: "%A").capitalize} #{l(delivery, format: "%d")} #{l(delivery, format: "%B").capitalize}"

  end

end
