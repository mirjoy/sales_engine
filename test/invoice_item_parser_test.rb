require_relative './test_helper'
require_relative '../lib/invoice_item_parser'

class InvoiceItemParserTest < Minitest::Test

  def test_it_exists
    assert InvoiceItemParser
  end

  def test_it_parses_a_csv_of_data
    filename = "./test/support/invoice_items.csv"
    parser = InvoiceItemParser.new(filename, nil)
    transactions = parser.parse

    first = transactions[0]
    assert_equal 1, first.id
    assert_equal 539, first.item_id

    second = transactions[1]
    assert_equal 2, second.id
    assert_equal 528, second.item_id
  end

end
