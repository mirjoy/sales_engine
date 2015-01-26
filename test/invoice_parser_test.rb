require_relative './test_helper'
require_relative '../lib/invoice_parser'

class InvoiceParserTest < Minitest::Test

  def test_it_exists
    assert InvoiceParser
  end

  def test_it_parses_a_csv_of_data
    filename = "./test/support/invoices.csv"
    parser = InvoiceParser.new(filename, nil)
    merchants = parser.parse

    first = merchants.first
    assert_equal 1, first.id
    assert_equal 26, first.merchant_id

    second = merchants[1]
    assert_equal 2, second.id
    assert_equal 75, second.merchant_id
  end

end
