require_relative '../lib/customer_parser'

class CustomerRepo
  attr_reader :all_customers,
              :sales_engine

  def initialize(data, parent_class)
    @all_customers = CustomerParser.new(data, parent_class)
    @sales_engine = parent_class
  end

  def all
    all_customers.parse
  end

  def random
    all_customers.parse.sample
  end

  def find_by_id(c_id)
    all_ids = all_customers.parse.select do |customer|
      customer.id == c_id
    end
    all_ids[0]
  end

  def find_by_name(lname)
    all_names = all_customers.parse.select do |customer|
      customer.first_name.downcase == lname.downcase
    end
    all_names[0]
  end

  def find_by_created_at(time)
    all_customers = all_customers.parse.select do |customer|
      customer.created_at == time
    end
    all_customers[0]
  end

  def find_by_updated_at(time)
    all_customers = all_customers.parse.select do |customer|
      customer.updated_at == time
    end
    all_customers[0]
  end

  def find_all_by_id(c_id)
    all_customers.parse.select do |customer|
      customer.id == c_id
    end
  end

  def find_all_by_first_name(first_name)
    all_customers.parse.select do |customer|
      customer.first_name.downcase == first_name.downcase
    end
  end

  def find_all_by_last_name(last_name)
    all_customers.parse.select do |customer|
      customer.last_name.downcase == last_name.downcase
    end
  end

  def find_all_by_created_at(time)
    all_customers.parse.select do |customer|
      customer.created_at == time
    end
  end

  def find_all_by_updated_at(time)
    all_customers.parse.select do |customer|
      customer.updated_at == time
    end
  end

  #find_by_x() CHECK
  #fina_all_by_x() CHECK
  #most_revenue(x) returns top customer instances ranked by total revenue
  #most_items(x) reutnrs top customer instances ranked by total number of items sold
  #revenue(date) returns total revenue for that date across all customers
end
