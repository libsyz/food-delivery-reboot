
class Customer
  attr_accessor :id
  attr_reader :name, :address

  def initialize(args = {})
    @id      =  args[:id]
    @name    =  args[:name]
    @address =  args[:address]
  end


end
