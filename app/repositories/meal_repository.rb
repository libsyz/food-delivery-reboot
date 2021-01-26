
require 'csv'
require_relative './../models/meal'
require_relative 'base_repository'

class MealRepository < BaseRepository




  private

  def model_name
    'Meal'
  end

  def build_element(element)
    [element.id, element.name, element.price]
  end

  def build_row
    ['id', 'name', 'price']
  end



  def parse_row(row)
    row[:id] = row[:id].to_i
    row[:price] = row[:price].to_i
    row
  end


end
