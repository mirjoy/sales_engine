require_relative './test_helper'
require_relative '../lib/customer'

class CustomerTest < Minitest::Test

  def test_it_exists
    assert Customer
  end

  def test_find_id
    customers = CSV.open('./data/customers.csv', headers: true, header_converters: :symbol)
    one_customer = customers.each do |customer|
      return customer
    end
    customer = Customer.new(one_customer)
    assert_equal 1, customer.id
  end

  def test_find_first_name
    customers = CSV.open('./data/customers.csv', headers: true, header_converters: :symbol)
    one_customer = customers.each do |customer|
      return customer
    end
    customer = Customer.new(one_customer)
    assert_equal "Joey", customer.first_name
  end

  def test_find_last_name
    customers = CSV.open('./data/customers.csv', headers: true, header_converters: :symbol)
    one_customer = customers.each do |customer|
      return customer
    end
    customer = Customer.new(one_customer)
    assert_equal "Ondricka", customer.last_name
  end

  def test_created_at
    customers = CSV.open('./data/customers.csv', headers: true, header_converters: :symbol)
    one_customer = customers.each do |customer|
      return customer
    end
    customer = Customer.new(one_customer)
    assert_equal "2012-03-27 14:54:09 UTC", customer.updated_at
  end

  def test_updated_at
    customers = CSV.open('./data/customers.csv', headers: true, header_converters: :symbol)
    one_customer = customers.each do |customer|
      return customer
    end
    customer = Customer.new(one_customer)
    assert_equal "2012-03-27 14:54:09 UTC", customer.updated_at
  end

  def test_second_one
    customers = CSV.open('./data/customers.csv', headers: true, header_converters: :symbol)
    count = 0

    one_customer = customers.each do |customer|
      count += 1
      if count == 2
        return customer
      end
    end

    customer = Customer.new(one_customer)
    assert_equal 2, customer.id
  end
end
