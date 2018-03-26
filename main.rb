require_relative "lib/product"
require_relative "lib/book"
require_relative "lib/film"
require_relative "lib/disk"
require_relative "lib/product_collection"
require_relative "lib/cart"

collection = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')

collection.sort!(by: :price, order: :asc)

cart = Cart.new # Создаём корзину покупателя

loop do
  puts "Что вы хотите купить:\n"
  collection.to_a.each_with_index do |product, index|
    puts "#{index += 1}. #{product}"
  end

  puts "0. Выход\n"

  user_choice = STDIN.gets.to_i

  if user_choice.between?(1, collection.to_a.length)
    product = collection.products[user_choice - 1]
    cart.add_to_cart(product)
    collection.to_a.delete_at(user_choice - 1) if product.amount.zero?
    puts "\nВы выбрали: #{product}\n\n"
  elsif user_choice == 0
    break
  else
    puts "Такого товара нет!"
  end
end

puts "\nВы купили:"
cart.buy_list.each_with_index do |product, index|
  puts "#{index += 1}. #{product}"
end

puts "\nС вас #{cart.total_price} руб. Спасибо за покупки!"
