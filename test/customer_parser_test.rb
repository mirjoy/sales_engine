require 'csv'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/customer_parser'
require_relative '../lib/invoice'

class CustomerParserTest < Minitest::Test

  def test_it_exists
    assert CustomerParser
  end

  def test_it_parses_a_csv_of_data
    filename = "./test/support/sample_customers.csv"
    parser = CustomerParser.new(filename, nil)
    customers = parser.parse

    first = customers.first
    assert_equal 1, first.id
    assert_equal "Joey", first.first_name

    second = customers[1]
    assert_equal 2, second.id
    assert_equal "Cecelia", second.first_name
  end
end

class FakeCustomerRepository
  attr_accessor :invoices

  def find_invoices_by_customer_id(id)
    @invoices
  end
end

class CustomerIntegrationTest < Minitest::Test

  def test_it_finds_related_orders
    skip
    @customer_repo = FakeCustomerRepository.new
    data = {:name => "My Shop"}
    @customer = Customer.new(data, @customer_repo)
    invoice = Array.new(5){ Invoice.new(:hi => "moarstuff")}
    @customer_repo.invoices = invoice
    assert_equal invoice, @customer.invoices
  end

end
