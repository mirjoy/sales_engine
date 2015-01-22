require_relative './test_helper'
require_relative '../lib/invoice_item'

class InvoiceItemTest < Minitest::Test

  def test_it_exists
    assert InvoiceItem
  end

  def test_it_stores_an_id
    invoice = InvoiceItem.new({:id => 6}, nil)
    assert_equal 6, invoice.id
  end

  def test_it_stores_ids_as_integers_only
    invoice = InvoiceItem.new({:id => '6'}, nil)
    assert_equal 6, invoice.id
  end

  def test_it_stores_a_quantity
    invoice = InvoiceItem.new({:quantity => 4}, nil)
    assert_equal 4, invoice.quantity
  end
end
