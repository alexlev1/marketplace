class Product
  attr_accessor :name, :price, :amount

  def initialize(params)
    @name = params[:name]
    @price = params[:price]
    @amount = params[:amount]
  end

  def update(params)
    @name = params[:name] if params[:name]
    @price = params[:price] if params[:price]
    @amount = params[:amount] if params[:amount]
  end
end