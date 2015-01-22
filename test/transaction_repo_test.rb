require_relative './test_helper'
require_relative '../lib/transaction_repo'


class TransactionRepoTest < Minitest::Test
  attr_accessor :transaction_repo

  def setup
    file = "./test/support/sample_transactions.csv"
    @transaction_repo = TransactionRepo.new(file, nil)
  end

  def test_it_exists
    assert TransactionRepo
  end

  def test_it_finds_all_transactions
    assert_equal 5, transaction_repo.all.count
  end

  def test_it_finds_the_third_transaction
    assert_equal "4354495077693036", transaction_repo.all[2].credit_card_number
  end

  def test_it_finds_all_transactions_by_id
    inv = transaction_repo.find_all_by_id(4)
    assert_equal "success", inv[0].result
  end

  def test_it_finds_one_invoice_by_invoice_id
    inv = transaction_repo.find_by_invoice_id(1)
    assert_equal "4654405418249632", inv.credit_card_number
  end

  def test_it_finds_an_invoice_by_credit_card_number
    inv = transaction_repo.find_all_by_credit_card_number("4654405418249632")
    assert_equal "2012-03-27 14:54:09 UTC", inv[0].created_at
  end

  def test_it_finds_all_invoices_by_result
    inv = transaction_repo.find_all_by_result("success")
    assert_equal 5, inv.count
  end

  def test_it_finds_a_random_invoice
    assert transaction_repo.random
  end

  def test_it_finds_a_transaction_by_created_at
    inv = transaction_repo.find_all_by_created_at("2012-03-27 14:54:09 UTC")
    assert_equal 2, inv.count
  end

  def test_it_finds_no_invoice_by_created_at
    inv = transaction_repo.find_all_by_created_at("2012-03-10 00:54:19 UTC")
    assert_equal 0, inv.count
  end

  def test_it_finds_invoice_by_updated_at
    inv = transaction_repo.find_all_by_updated_at("2012-03-27 14:54:10 UTC")
    assert_equal 3, inv.count
  end


end
