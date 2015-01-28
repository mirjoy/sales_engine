require_relative './test_helper'
require_relative '../lib/invoice_repo'
require_relative '../lib/transaction_repo'
require_relative '../lib/invoice_item_repo'
require_relative '../lib/item_repo'
require_relative '../lib/customer_repo'
require_relative '../lib/merchant_repo'

class InvoiceRepoTest < Minitest::Test
  attr_accessor :invoice_repository

  def setup
    file = "./test/support/invoices.csv"
    @invoice_repository = InvoiceRepo.new(file, nil)
  end

  def test_it_exists
    assert InvoiceRepo
  end

  def test_it_finds_all_invoices
    assert_equal 5, invoice_repository.all.count
  end

  def test_it_finds_the_third_invoice
    assert_equal 78, invoice_repository.all[2].merchant_id
  end

  def test_it_finds_all_invoices_by_id
    inv = invoice_repository.find_all_by_id(4)
    assert_equal "shipped", inv[0].status
  end

  def test_it_finds_one_invoice_by_id
    inv = invoice_repository.find_by_customer_id(1)
    assert_equal "shipped", inv.status
  end

  def test_it_finds_all_invoices_by_customer_id
    inv = invoice_repository.find_all_by_customer_id(1)
    assert_equal 5, inv.count
  end

  def test_it_finds_one_invoice_by_customer_id
    inv = invoice_repository.find_all_by_customer_id(1)
    assert_equal "2012-03-25 09:54:09 UTC", inv[0].created_at
  end

  def test_it_finds_all_invoices_by_merchant_id
    inv = invoice_repository.find_all_by_merchant_id(75)
    assert_equal "2012-03-12 05:54:09 UTC", inv[0].created_at
  end

  def test_it_finds_one_invoice_by_merchant_id
    inv = invoice_repository.find_by_merchant_id(75)
    assert_equal "2012-03-12 05:54:09 UTC", inv.created_at
  end

  def test_it_finds_a_random_invoice
    assert invoice_repository.random
  end

  def test_it_finds_invoice_by_created_at
    inv = invoice_repository.find_all_by_created_at("2012-03-10 00:54:09 UTC")
    assert_equal 1, inv.count
  end

  def test_it_finds_no_invoice_by_created_at
    inv = invoice_repository.find_all_by_created_at("2012-03-10 00:54:19 UTC")
    assert_equal 0, inv.count
  end

  def test_it_finds_invoice_by_updated_at
    inv = invoice_repository.find_all_by_updated_at("2012-03-07 19:54:10 UTC")
    assert_equal 1, inv.count
  end


end


class InvoiceIntegrationTest < Minitest::Test
  attr_reader :sales,
              :invoice_repository,
              :transaction_repo,
              :invoice_item_repo,
              :item_repo,
              :customer_repo,
              :merchant_repo

  def setup
    @sales = SalesEngine.new('./test/support')
    @invoice_repo = InvoiceRepo.new('./test/support/invoices.csv', sales)
    @transaction_repo = TransactionRepo.new('./test/support/transactions.csv', sales)
    @invoice_item_repo = InvoiceItemRepo.new('./test/support/invoice_items.csv', sales)
    @item_repo = ItemRepo.new('./test/support/items.csv', sales)
    @customer_repo = CustomerRepo.new('./test/support/customers.csv', sales)
    @merchant_repo = MerchantRepo.new('./test/support/merchants.csv', sales)
  end

  def test_it_finds_related_transactions
    stuff = sales.invoice_repository.transactions(1)
    assert_equal 1, stuff.count
  end

  def test_it_finds_related_invoices_items
    stuff = sales.invoice_repository.invoice_items(1)
    assert_equal 5, stuff.count
  end

  def test_it_finds_related_items
    skip
    stuff = invoice_repository.items(1)
    assert_equal 1, stuff.count
  end

  def test_it_finds_related_customer
    stuff = sales.invoice_repository.customer(1)
    assert_equal 1, stuff.count
  end

  def test_it_finds_related_merchant
    stuff = sales.invoice_repository.merchant(1)
    assert_equal "Schroeder-Jerde", stuff.name
  end

  def test_it_finds_pending_sales
    stuff = sales.invoice_repository.pending
    assert_equal 2, stuff.count
  end
end
