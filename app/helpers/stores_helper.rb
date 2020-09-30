module StoresHelper

  def address_street(store)
    "#{store.street} #{store.street_number}, #{store.city}"
  end

  def address_location(store)
    "#{store.zip_code} - #{store.state}"
  end

  def delivery_time(store)
    case store.delivery_time
    when 24
      return "1 Giorno Lavorativo"
    when 48
      return "2 Giorni Lavorativi"
    when 72
      return "3 Giorni Lavorativi"
    when 96
      return "4 Giorni Lavorativi"
    end
  end


  def store_offer_free_delivery_up_to_a_certain_amount?(store)
    store.free_delivery_threshold_cents > 0
  end

  def stringify_delivery_duration(store)
    i = store.delivery_time
    suffix = i == 0 ? 'o' : 'i'
    "Consegna entro #{i} giorn#{suffix} lavorativ#{suffix}"
  end
end
