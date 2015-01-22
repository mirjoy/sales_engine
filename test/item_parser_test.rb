require_relative './test_helper'
require_relative '../lib/item_parser'
# require_relative '../lib/invoice_items'

class ItemParserTest < Minitest::Test

  def test_it_exists
    assert ItemParser
  end

  def test_it_parses_a_csv_of_data
    filename = "./test/support/sample_items.csv"
    parser = ItemParser.new(filename, nil)
    items = parser.parse

    first = items.first
    assert_equal 1, first.id
    assert_equal "Item Qui Esse", first.name

    second = items[1]
    assert_equal 2, second.id
    assert_equal "Item Autem Minima", second.name
  end
end

class FakeItemRepository
  attr_accessor :invoices

  def find_invoices_by_item_id(id)
    @invoices
  end
end

class ItemIntegrationTest < Minitest::Test

  def test_it_finds_related_orders
    skip
    @item_repo = FakeItemRepository.new
    data = {:name => "My Shop"}
    @item = Item.new(data, @item_repo)
    invoice = Array.new(5){ Invoice.new(:hi => "moarstuff")}
    @item_repo.invoices = invoice
    assert_equal invoice, @item.invoices
  end

end
