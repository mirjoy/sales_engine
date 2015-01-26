require_relative './test_helper'
require_relative '../lib/customer_parser.rb'

class CustomerParserTest < Minitest::Test

  def test_it_exists
    assert CustomerParser
  end

  def test_it_parses_a_csv_of_data
    filename = "./test/support/customers.csv"
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
