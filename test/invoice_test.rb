require 'csv'
require './lib/invoice'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class InvoiceTest < Minitest::Test

  def test_it_exists
    assert Invoice
  end

  def test_find_id
    invoice = CSV.open('./data/invoices.csv', headers: true, header_converters: :symbol)

    one_invoice = invoice.each do |t|
      return t
    end

    invoice_one = Invoice.new(one_invoice)
    assert_equal 1, invoice_one.id
  end

  def test_find_customer_id
    invoice = CSV.open('./data/invoices.csv', headers: true, header_converters: :symbol)

    one_invoice = invoice.each do |t|
      return t
    end

    invoice_one = Invoice.new(one_invoice)
    assert_equal 1, invoice_one.customer_id
  end

  def test_find_merchant_id
    invoice = CSV.open('./data/invoices.csv', headers: true, header_converters: :symbol)

    one_invoice = invoice.each do |t|
      return t
    end

    invoice_one = Invoice.new(one_invoice)
    assert_equal 26, invoice_one.merchant_id
  end

  def test_find_status
    invoice = CSV.open('./data/invoices.csv', headers: true, header_converters: :symbol)

    one_invoice = invoice.each do |t|
      return t
    end

    invoice_one = Invoice.new(one_invoice)
    assert_equal "shipped", invoice_one.status
  end

  def test_find_created_at
    invoice = CSV.open('./data/invoices.csv', headers: true, header_converters: :symbol)

    one_invoice = invoice.each do |t|
      return t
    end

    invoice_one = Invoice.new(one_invoice)
    assert_equal "2012-03-25 09:54:09 UTC", invoice_one.created_at
  end

  def test_find_updated_at
    invoice = CSV.open('./data/invoices.csv', headers: true, header_converters: :symbol)

    one_invoice = invoice.each do |t|
      return t
    end

    invoice_one = Invoice.new(one_invoice)
    assert_equal "2012-03-25 09:54:09 UTC", invoice_one.updated_at
  end

end
