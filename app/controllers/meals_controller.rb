require_relative './../views/view'

class MealsController

  def initialize(meal_repo)
    @meal_repo = meal_repo
    @view = View.new
  end

  def add
    meal_name = @view.ask_for("meal name")
    price = @view.ask_for("price")
    new_meal = Meal.new(name: meal_name, price: price.to_i)
    @meal_repo.create(new_meal)
  end

  def list
    # tell the repo to give me all the meals
    meals = @meal_repo.all
    # pass the meals to the view to be displayed
    @view.render_meals(meals)
  end


end
