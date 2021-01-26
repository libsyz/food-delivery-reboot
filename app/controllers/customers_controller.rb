require_relative './../views/view'

class CustomersController

  def initialize(customer_repo)
    @customer_repo = customer_repo
    @view = View.new
  end

  def add
    customer_name = @view.ask_for("customer name")
    address = @view.ask_for("address")
    new_customer = Customer.new(name: customer_name, address: address)
    @customer_repo.create(new_customer)
  end

  def list
    # tell the repo to give me all the meals
    customers = @customer_repo.all
    # pass the customers to the view to be displayed
    @view.render_customers(customers)
  end


end
