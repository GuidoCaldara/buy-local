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
end
