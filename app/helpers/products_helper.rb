module ProductsHelper

  def integer_price(product)
    if product.discounted_price > 0
     return product.discounted_price.to_s.split(".")[0]
    else
     return product.price.to_s.split(".")[0]
    end
  end

  def decimal_price(product)
    if product.discounted_price > 0
     return product.discounted_price.to_s.split(".")[1]
    else
     return product.price.to_s.split(".")[1]
    end
  end

  def current_price(product)
    if product.discounted_price != 0
      return product.discounted_price
    else
       return product.price
    end
  end


  def package_type(product, amount = 1)
    word = ''
    case product.package.name
    when "box"
      word = "Confezione"
    when "jar"
      word = "Barattolo"
    when "kg"
      word = "Kilo"
    when "hg"
      word = "Etto"
    when "g"
      word = "Grammo"
    when "piece"
      word = "Pezzo"
    end
    if amount > 1
      word = word[0..-2] + "i"
    end

    return word
  end
end


