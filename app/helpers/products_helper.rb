module ProductsHelper
  def integer_price(product)
    product.price.to_s.split(".")[0]
  end
  def decimal_price(product)
    product.price.to_s.split(".")[1]
  end
  def integer_discounted_price(product)
    product.discounted_price.to_s.split(".")[0]
  end
  def decimal_discounted_price(product)
    product.discounted_price.to_s.split(".")[1]
  end
  def package_type(product, amount = 1)
    word = ''
    case product.package.name
    when "box"
      word = "Confezione"
    when "jar"
      word = "Barattolo"
    when "Kg"
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


