require_relative "lib/goods/product"
require_relative "lib/goods/book"
require_relative "lib/goods/film"
require_relative "lib/goods/disk"
require_relative "lib/product_collection"
require_relative "lib/cart"

collection = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')

collection.sort!(by: :price, order: :asc)

cart = Cart.new # Создаём корзину покупателя

loop do
  puts collection.show_products_list

  user_choice = STDIN.gets.to_i

  if user_choice.between?(1, collection.to_a.length)
    product = collection.product_choice(user_choice)
    cart.add_to_cart(product)
    collection.delete_product(user_choice, product)
    puts "\nВы выбрали: #{product}\n\n"
  elsif user_choice == 0
    break
  else
    puts "Такого товара нет!"
  end
end

puts cart.show_buy_list