require 'csv'
require 'minitest/autorun'
require 'minitest/pride'
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
