require_relative './test_helper'
require_relative '../lib/transaction'
require_relative '../lib/transaction'
require_relative '../lib/transaction'

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

class TransactionIntegrationTest < Minitest::Test
  attr_reader :transaction_repo,
              :invoice_repo

  def setup
    sales = SalesEngine.new("./test/support")
    @transaction_repo = TransactionRepo.new('./test/support/transactions.csv', sales)
    @invoice_repo = InvoiceRepo.new('./test/support/invoices.csv', sales)
  end

  def test_invoice
    skip
    num = transaction.invoice(1)
    assert_equal 1, num.count
  end
end
