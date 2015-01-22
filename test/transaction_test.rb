require_relative './test_helper'
require './lib/transaction'

class TransactionTest < Minitest::Test

  def test_it_exists
    assert Transaction
  end

  def test_it_stores_an_id
    invoice = Transaction.new({:id => 6}, nil)
    assert_equal 6, invoice.id
  end

  def test_it_stores_ids_as_integers_only
    invoice = Transaction.new({:id => '6'}, nil)
    assert_equal 6, invoice.id
  end

  def test_it_stores_a_result
    invoice = Transaction.new({:result => 'success'}, nil)
    assert_equal "success", invoice.result
  end
end
