class Book < Product
  attr_accessor :genre, :author

  def initialize(params)
    super
    @genre = params[:genre]
    @author = params[:author]
  end

  def to_s
    puts "Книга #{name}, #{genre}, автор - #{author}, #{price} руб. (осталось #{amount})"
  end

  def update(params)
    super
    @genre = params[:genre] if params[:genre]
    @author = params[:author] if params[:author]
  end
end