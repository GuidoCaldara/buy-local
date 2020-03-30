module StoresHelper

  def full_address
    [street, street_number, city, state, country].compact.join(', ')
  end

end
