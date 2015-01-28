require_relative './test_helper'
require_relative '../lib/invoice_item_repo'
require_relative '../lib/invoice_repo'

class InvoiceItemRepoTest < Minitest::Test
  attr_accessor :invoice_item_repository

  def setup
    file = "./test/support/invoice_items.csv"
    @invoice_item_repository = InvoiceItemRepo.new(file, nil)
  end

  def test_it_exists
    assert InvoiceItemRepo
  end

  def test_it_finds_all_invoice_items
    assert_equal 5, invoice_item_repository.all.count
  end

  def test_it_finds_a_random_invoice_item
    assert invoice_item_repository.random
  end

  def test_it_finds_the_third_invoice_item
    assert_equal 523, invoice_item_repository.all[2].item_id
  end

  def test_it_finds_all_invoice_items_by_invoice_id
    inv = invoice_item_repository.find_all_by_invoice_id(1)
    assert_equal 5, inv.count
  end

  def test_it_finds_an_invoice_item_by_quantity
    inv = invoice_item_repository.find_by_quantity(9)
    assert_equal 528, inv.item_id
  end

  def test_it_finds_all_invoice_items_by_unit_price
    inv = invoice_item_repository.find_all_by_unit_price(21.96)
    assert_equal 1, inv.count
  end

  def test_it_finds_a_transaction_by_created_at
    inv = invoice_item_repository.find_all_by_created_at("2012-03-27 14:54:09 UTC")
    assert_equal 5, inv.count
  end

  def test_it_finds_no_invoice_item_by_created_at
    inv = invoice_item_repository.find_all_by_created_at("2012-03-10 00:54:19 UTC")
    assert_equal 0, inv.count
  end

  def test_it_finds_invoice_item_by_updated_at
    inv = invoice_item_repository.find_all_by_updated_at("2012-03-27 14:54:09 UTC")
    assert_equal 5, inv.count
  end

end


class InvoiceItemIntegrationTest < Minitest::Test
  attr_reader :sales
              :invoice_item_repository
              :invoice_repo

  def setup
    @sales = SalesEngine.new('./test/support')
    @invoice_item_repository = InvoiceItemRepo.new('./test/support/invoice_items.csv', sales)
    @invoice_repo = InvoiceRepo.new('./test/support/invoices.csv', sales)
  end

  def test_it_finds_related_invoice
    skip
    stuff = sales.invoice_item_repository.invoices(1)
    assert_equal 1, stuff.count
  end

  def test_it_finds_related_item
    skip
    stuff = sales.invoice_item_repository.items(1)
    assert_equal 1, stuff.count
  end
end
