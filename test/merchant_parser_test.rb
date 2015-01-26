require_relative './test_helper'
require_relative '../lib/merchant_parser'
require_relative '../lib/invoice'

class MerchantParserTest < Minitest::Test

  def test_it_exists
    assert MerchantParser
  end

  def test_it_parses_a_csv_of_data
    filename = "./test/support/merchants.csv"
    parser = MerchantParser.new(filename, nil)
    merchants = parser.parse

    first = merchants.first
    assert_equal 1, first.id
    assert_equal "Schroeder-Jerde", first.name

    second = merchants[1]
    assert_equal 2, second.id
    assert_equal "Klein, Rempel and Jones", second.name
    end
end
