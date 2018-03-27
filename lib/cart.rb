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

  def show_buy_list
    show_buys = "\nВы купили:\n"
    buy_list.each_with_index { |product, index| show_buys += "#{index += 1}. #{product}\n" }
    show_buys += "\nС вас #{total_price} руб. Спасибо за покупки!"
  end
end