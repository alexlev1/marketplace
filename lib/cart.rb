class Cart
  attr_reader :buy_list, :total_price

  def initialize
    @buy_list = []
    @total_price = 0
  end

  def add_to_cart(product)
    @buy_list << product
    @total_price += product.price
    product.amount -= 1
  end
end