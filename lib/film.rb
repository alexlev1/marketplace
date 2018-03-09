class Film < Product
  attr_accessor :year, :director

  def initialize(params)
    super
    @year = params[:year]
    @director = params[:director]
  end

  def to_s
    puts "Фильм \"#{name}\", #{year_created}, реж. #{director}, #{price} руб. (осталось #{amount})"
  end

  def update(params)
    super
    @year = params[:year] if params[:year]
    @director = params[:director] if params[:director]
  end
end