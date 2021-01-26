
class View

  def ask_for(stuff)
    puts "#{stuff}?"
    print ">"
    gets.chomp
  end

  def render_meals(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1 } - #{meal.name} - #{meal.price}"
    end
  end

  def render_customers(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1 } - #{customer.name} - #{customer.address}"
    end
  end


end
