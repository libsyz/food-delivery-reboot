
class Meal
  attr_accessor :id
  attr_reader :name, :price

  def initialize(args={})
    @id = args[:id]
    @name = args[:name]
    @price = args[:price]
  end


end
