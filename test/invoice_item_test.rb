require 'csv'
require './lib/invoice_item'
require 'minitest/autorun'
require 'minitest/pride'

class InvoiceItemTest < Minitest::Test

  def test_it_exists
    assert InvoiceItem
  end

  def test_find_id
    invoice_items = CSV.open('./data/invoice_items.csv', headers: true, header_converters: :symbol)

    one_invoice_item = invoice_items.each do |ii|
      return ii
    end

    invoice_items = InvoiceItem.new(one_invoice_item)
    assert_equal 1, invoice_items.id
  end

  def test_find_item_id
    invoice_items = CSV.open('./data/invoice_items.csv', headers: true, header_converters: :symbol)

    one_invoice_item = invoice_items.each do |ii|
      return ii
    end

    invoice_items = InvoiceItem.new(one_invoice_item)
    assert_equal 539, invoice_items.item_id
  end

  def test_find_invoice_id
    invoice_items = CSV.open('./data/invoice_items.csv', headers: true, header_converters: :symbol)

    one_invoice_item = invoice_items.each do |ii|
      return ii
    end

    invoice_items = InvoiceItem.new(one_invoice_item)
    assert_equal 1, invoice_items.invoice_id
  end

  def test_find_quantity
    invoice_items = CSV.open('./data/invoice_items.csv', headers: true, header_converters: :symbol)

    one_invoice_item = invoice_items.each do |ii|
      return ii
    end

    invoice_items = InvoiceItem.new(one_invoice_item)
    assert_equal 5, invoice_items.quantity
  end

  def test_find_unit_price
    invoice_items = CSV.open('./data/invoice_items.csv', headers: true, header_converters: :symbol)

    one_invoice_item = invoice_items.each do |ii|
      return ii
    end

    invoice_items = InvoiceItem.new(one_invoice_item)
    assert_equal 13635, invoice_items.unit_price
  end

  def test_find_created_at
    invoice_items = CSV.open('./data/invoice_items.csv', headers: true, header_converters: :symbol)

    one_invoice_item = invoice_items.each do |ii|
      return ii
    end

    invoice_items = InvoiceItem.new(one_invoice_item)
    assert_equal "2012-03-27 14:54:09 UTC", invoice_items.created_at
  end

  def test_find_updated_at
    invoice_items = CSV.open('./data/invoice_items.csv', headers: true, header_converters: :symbol)

    one_invoice_item = invoice_items.each do |ii|
      return ii
    end

    invoice_items = InvoiceItem.new(one_invoice_item)
    assert_equal "2012-03-27 14:54:09 UTC", invoice_items.updated_at
  end
end
