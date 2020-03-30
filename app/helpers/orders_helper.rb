module OrdersHelper

  def current_status(status)
    case status
    when 'pending'
      return "In attesa di Pagamento"
    when 'paied'
      return "Pagato"
    when 'declined'
      return "Pagamento rifiutato"
    end
  end

end
