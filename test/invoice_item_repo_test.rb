require_relative './test_helper'
require_relative '../lib/invoice_item_repo'

class InvoiceItemRepoTest < Minitest::Test
  attr_accessor :invoice_item_repo

  def setup
    file = "./test/support/invoice_items.csv"
    @invoice_item_repo = InvoiceItemRepo.new(file, nil)
  end

  def test_it_exists
    assert InvoiceItemRepo
  end

  def test_it_finds_all_invoice_items
    assert_equal 5, invoice_item_repo.all.count
  end

  def test_it_finds_a_random_invoice_item
    assert invoice_item_repo.random
  end

  def test_it_finds_the_third_invoice_item
    assert_equal 523, invoice_item_repo.all[2].item_id
  end

  def test_it_finds_all_invoice_items_by_invoice_id
    inv = invoice_item_repo.find_all_by_invoice_id(1)
    assert_equal 5, inv.count
  end

  def test_it_finds_an_invoice_item_by_quantity
    inv = invoice_item_repo.find_by_quantity(9)
    assert_equal 528, inv.item_id
  end

  def test_it_finds_all_invoice_items_by_unit_price
    inv = invoice_item_repo.find_by_unit_price(2196)
    assert_equal 3, inv.quantity
  end

  def test_it_finds_a_transaction_by_created_at
    inv = invoice_item_repo.find_all_by_created_at("2012-03-27 14:54:09 UTC")
    assert_equal 5, inv.count
  end

  def test_it_finds_no_invoice_item_by_created_at
    inv = invoice_item_repo.find_all_by_created_at("2012-03-10 00:54:19 UTC")
    assert_equal 0, inv.count
  end

  def test_it_finds_invoice_item_by_updated_at
    inv = invoice_item_repo.find_all_by_updated_at("2012-03-27 14:54:09 UTC")
    assert_equal 5, inv.count
  end

end


class InvoiceItemIntegrationTest < Minitest::Test
  attr_reader :sales

  def setup
    @sales = SalesEngine.new('./test/support')
  end

  def test_it_finds_related_invoice
    skip
    stuff = sales.invoice_item_repo.invoices(1)
    assert_equal 15, stuff.count
  end

  def test_it_finds_related_item
    skip
    stuff = sales.invoice_item_repo.items(1)
    assert_equal 59, stuff.count
  end
end
