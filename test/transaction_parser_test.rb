require_relative './test_helper'
require_relative '../lib/transaction_parser'

class TransactionParserTest < Minitest::Test

  def test_it_exists
    assert TransactionParser
  end

  def test_it_parses_a_csv_of_data
    filename = "./test/support/sample_transactions.csv"
    parser = TransactionParser.new(filename, nil)
    transactions = parser.parse

    first = transactions[0]
    assert_equal 1, first.id
    assert_equal "4654405418249632", first.credit_card_number

    second = transactions[1]
    assert_equal 2, second.id
    assert_equal "4580251236515201", second.credit_card_number
  end

end
