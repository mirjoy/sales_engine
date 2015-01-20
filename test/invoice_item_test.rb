require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice_item'

class InvoiceItemTest < Minitest::Test
  attr_reader :invoice_item

  def setup
    @invoice_item = InvoiceItem.new
  end

  def test_it_exists
    assert InvoiceItem
  end

  def test_we_can_find_id
    skip
  end

end
