
require 'csv'
require_relative './../models/customer'
require_relative 'base_repository'

class CustomerRepository < BaseRepository

  private

  def model_name
    'Customer'
  end
  def build_element(element)
    [element.id, element.name, element.address]
  end

  def build_row
    ['id', 'name', 'address']
  end

  def parse_row(row)
    row[:id] = row[:id].to_i
    row
  end

end
