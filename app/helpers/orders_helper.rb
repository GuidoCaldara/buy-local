module OrdersHelper

  def current_status(order)
    case order.status
    when 'pending'
      return "In attesa di Pagamento"
    when 'paid'
      return "Pagato"
    when 'on delivery'
      return "In Consegna"
    when 'declined'
      return "Pagamento rifiutato"
    end
  end

end
