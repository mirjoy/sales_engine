require_relative './test_helper'
require_relative '../lib/invoice_repo'


class InvoiceRepoTest < Minitest::Test
  attr_accessor :invoice_repo

  def setup
    file = "./test/support/sample_invoices.csv"
    @invoice_repo = InvoiceRepo.new(file, nil)
  end

  def test_it_exists
    assert InvoiceRepo
  end

  def test_it_finds_all_invoices
    assert_equal 5, invoice_repo.all.count
  end

  def test_it_finds_the_third_invoice
    assert_equal 78, invoice_repo.all[2].merchant_id
  end

  def test_it_finds_all_invoices_by_id
    inv = invoice_repo.find_all_by_id(4)
    assert_equal "shipped", inv[0].status
  end

  def test_it_finds_one_invoice_by_id
    inv = invoice_repo.find_by_customer_id(1)
    assert_equal "shipped", inv.status
  end

  def test_it_finds_all_invoices_by_customer_id
    inv = invoice_repo.find_all_by_customer_id(1)
    assert_equal 5, inv.count
  end

  def test_it_finds_one_invoice_by_customer_id
    inv = invoice_repo.find_all_by_customer_id(1)
    assert_equal "2012-03-25 09:54:09 UTC", inv[0].created_at
  end

  def test_it_finds_all_invoices_by_merchant_id
    inv = invoice_repo.find_all_by_merchant_id(75)
    assert_equal "2012-03-12 05:54:09 UTC", inv[0].created_at
  end

  def test_it_finds_one_invoice_by_merchant_id
    inv = invoice_repo.find_by_merchant_id(75)
    assert_equal "2012-03-12 05:54:09 UTC", inv.created_at
  end

  def test_it_finds_a_random_invoice
    assert invoice_repo.random
  end

  def test_it_finds_invoice_by_created_at
    inv = invoice_repo.find_all_by_created_at("2012-03-10 00:54:09 UTC")
    assert_equal 1, inv.count
  end

  def test_it_finds_no_invoice_by_created_at
    inv = invoice_repo.find_all_by_created_at("2012-03-10 00:54:19 UTC")
    assert_equal 0, inv.count
  end

  def test_it_finds_invoice_by_updated_at
    inv = invoice_repo.find_all_by_updated_at("2012-03-07 19:54:10 UTC")
    assert_equal 1, inv.count
  end


end


class InvoiceIntegrationTest < Minitest::Test
  attr_reader :sales,
              :invoice_repo,
              :invoice_item_repo

  def setup
    @sales = SalesEngine.new
    @invoice_repo = InvoiceRepo.new('./test/support/samples_invoices.csv', sales)
    @invoice_item_repo = InvoiceItemRepo.new('./test/support/samples_invoice_items.csv', sales)
  end

  def test_it_finds_related_transactions
    skip
    stuff = sales.invoice_repo.transactions(1)
    assert_equal 15, stuff.count
  end

  def test_it_finds_related_invoices_items
    skip
    stuff = sales.invoice_repo.invoice_items(1)
    assert_equal 59, stuff.count
  end

  def test_it_finds_related_items
    skip
    stuff = invoice_repo.items(1)
    assert_equal 59, stuff.count
  end

  def test_it_finds_related_customer
    skip
    stuff = sales.invoice_repo.customer(1)
    assert_equal 59, stuff.count
  end

  def test_it_finds_related_merchant
    skip
    stuff = sales.invoice_repo.merchant(1)
    assert_equal 59, stuff.count
  end

end
