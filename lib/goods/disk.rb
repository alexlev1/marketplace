class Disk < Product
  attr_accessor :title, :artist, :genre, :year

  def self.from_file(file_path)
    lines = File.readlines(file_path, encoding: 'UTF-8').map { |l| l.chomp }

    self.new(
      title: lines[0], # Название альбома
      artist: lines[1], # Исполнитель
      genre: lines[2], # Жанр
      year: lines[3].to_i, # Год выпуска
      price: lines[4].to_i, # Цена
      amount: lines[5].to_i # Остаток
    )
  end

  def initialize(params)
    super

    @title = params[:title]
    @artist = params[:artist]
    @genre = params[:genre]
    @year = params[:year]
  end

  def to_s
    "Альбом #{artist} - \"#{title}\", #{genre}, #{year}, #{price} руб. (осталось #{amount})"
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @artist = params[:artist] if params[:artist]
    @genre = params[:genre] if params[:genre]
    @year = params[:year] if params[:year]
  end
end