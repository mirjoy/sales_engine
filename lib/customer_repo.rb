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
    find_all_by_id(c_id)[0]
  end

  def find_by_first_name(fname)
    find_all_by_first_name(fname)[0]
  end

  def find_by_last_name(lname)
    find_all_by_last_name(lname)[0]
  end

  def find_by_created_at(time)
    find_all_by_created_at(time)[0]
  end

  def find_by_updated_at(time)
    find_all_by_updated_at(time)[0]
  end

  def find_all_by_id(c_id)
    all.find_all do |customer|
      customer.id == c_id
    end
  end

  def find_all_by_first_name(fname)
    all.find_all do |customer|
      customer.first_name.downcase == fname.downcase
    end
  end

  def find_all_by_last_name(lname)
    all.find_all do |customer|
      customer.last_name.downcase == lname.downcase
    end
  end

  def find_all_by_created_at(time)
    all.find_all do |customer|
      customer.created_at == time
    end
  end

  def find_all_by_updated_at(time)
    all.find_all do |customer|
      customer.updated_at == time
    end
  end

  def find_by_invoice_id(invoice_id)
    all.find_all do |customer|
      customer.id == invoice_id
    end
  end

  def invoices(customer_id)
    sales_engine.invoice_repository.find_all_by_customer_id(customer_id)
  end
end
