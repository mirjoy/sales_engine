require_relative './test_helper'
require_relative '../lib/invoice'

class InvoiceTest < Minitest::Test

  def test_it_exists
    assert Invoice
  end

  def test_it_stores_an_id
    invoice = Invoice.new({:id => 6}, nil)
    assert_equal 6, invoice.id
  end

  def test_it_stores_ids_as_integers_only
    binding.pry
    invoice = Invoice.new({:id => '6'}, nil)
    assert_equal 6, invoice.id
  end

  def test_it_stores_a_status
    invoice = Invoice.new({:status => 'shipped'}, nil)
    assert_equal "shipped", invoice.status
  end
end
