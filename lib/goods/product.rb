class Product
  attr_accessor :price, :amount

  def self.from_file(file_path)
    raise NotImplementedError "Нельзя создать метод родителя"
  end

  def initialize(params)
    @price = params[:price]
    @amount = params[:amount]
  end

  def update(params)
    @price = params[:price] if params[:price]
    @amount = params[:amount] if params[:amount]
  end
end