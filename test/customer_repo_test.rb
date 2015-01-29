require_relative './test_helper'
require_relative '../lib/customer_repo'
require_relative '../lib/invoice_repo'


class CustomerRepoTest < Minitest::Test
  attr_accessor :customer_repository

  def setup
    file = "./test/support/customers.csv"
    @customer_repository = CustomerRepo.new(file, nil)
  end

  def test_it_exists
    assert CustomerRepo
  end

  def test_it_finds_all_customers
    assert_equal "Joey", customer_repository.all[0].first_name
  end

  def test_it_finds_the_third_customer
    assert_equal "Leanne", customer_repository.all[3].first_name
  end

  def test_it_finds_a_customer_by_first_name_case_insensitively
    customer = customer_repository.find_by_first_name("LeannE")
    assert_equal "Braun", customer.last_name
  end

  def test_it_finds_all_customers_by_first_name_case_insensitively
    customer = customer_repository.find_all_by_first_name("LeannE")
    assert_equal "Leanne", customer[0].first_name
    assert_equal 2, customer.count
  end

  def test_it_finds_a_customer_by_last_name_case_insensitively
    customer = customer_repository.find_by_last_name("BRaun")
    assert_equal "Leanne", customer.first_name
  end


  def test_it_finds_all_customers_by_last_name_case_insensitively
    customer = customer_repository.find_all_by_last_name("BrauN")
    assert_equal "Leanne", customer[0].first_name
    assert_equal 2, customer.count
  end

  def test_it_finds_all_customers_by_id
    customer = customer_repository.find_all_by_id(4)
    assert_equal "Leanne", customer[0].first_name
    assert_equal 2, customer.count
  end

  def test_it_finds_a_random_customer
    assert customer_repository.random
  end

  def test_it_finds_customer_by_created_at
    date = Date.parse("2012-03-27 14:54:09 UTC")
    customer = customer_repository.find_all_by_created_at(date)
    assert_equal 6, customer.count
  end

  def test_it_finds_customer_by_updated_at
    date = Date.parse("2012-03-27 14:54:09 UTC")
    customer = customer_repository.find_all_by_updated_at(date)
    assert_equal 6, customer.count
  end
end


class CustomerIntegrationTest < Minitest::Test
  attr_reader :sales,
              :customer_repository,
              :invoice_repo

  def setup
    @sales = SalesEngine.new('./test/support')
    @customer_repository = CustomerRepo.new('./test/support/customers.csv', sales)
    @invoice_repo = InvoiceRepo.new('./test/support/invoices.csv', sales)
  end

  def test_invoices
    stuff = sales.customer_repository.invoices(1)
    assert_equal 5, stuff.count
  end
end
