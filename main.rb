require_relative "lib/product.rb"
require_relative "lib/book.rb"
require_relative "lib/film.rb"

movie = Film.new(price: 290, amount: 4)

puts "Фильм Леон стоит #{movie.price} рублей"