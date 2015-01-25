require_relative './test_helper'
require_relative '../lib/customer_repo'


class CustomerRepoTest < Minitest::Test
  attr_accessor :customer_repo

  def setup
    file = "./test/support/sample_customers.csv"
    @customer_repo = CustomerRepo.new(file, nil)
  end

  def test_it_exists
    assert CustomerRepo
  end

  def test_it_finds_all_customers
    assert_equal "Joey", customer_repo.all[0].first_name
  end

  def test_it_finds_the_third_customer
    assert_equal "Leanne", customer_repo.all[3].first_name
  end

  def test_it_finds_all_customers_by_first_name_case_insensitively
    customer = customer_repo.find_all_by_first_name("LeannE")
    assert_equal "Leanne", customer[0].first_name
    assert_equal 2, customer.count
  end

  def test_it_finds_all_customers_by_last_name_case_insensitively
    customer = customer_repo.find_all_by_last_name("BrauN")
    assert_equal "Braun", customer[0].last_name
    assert_equal 2, customer.count
  end

  def test_it_finds_all_customers_by_id
    customer = customer_repo.find_all_by_id(4)
    assert_equal "Leanne", customer[0].first_name
    assert_equal 2, customer.count
  end

  def test_it_finds_a_random_customer
    assert customer_repo.random
  end

  def test_it_finds_customer_by_created_at
    customer = customer_repo.find_all_by_created_at("2012-03-27 14:54:09 UTC")
    assert_equal 1, customer.count
  end

  def test_it_finds_customer_by_updated_at
    customer = customer_repo.find_all_by_updated_at("2012-03-27 14:54:09 UTC")
    assert_equal 1, customer.count
  end
end


class CustomerIntegrationTest < Minitest::Test
  attr_reader :sales

  def setup
    @sales = SalesEngine.new
  end

  def test_it_finds_related_invoices
    skip
    stuff = sales.customer_repo.invoices(1)
    assert_equal 15, stuff.count
  end
end
