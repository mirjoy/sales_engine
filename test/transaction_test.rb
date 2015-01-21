require 'csv'
require './lib/transaction'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class TransactionTest < Minitest::Test

  def test_it_exists
    assert Transaction
  end

  def test_find_id
    transact = CSV.open('./data/transactions.csv', headers: true, header_converters: :symbol)

    one_transaction = transact.each do |t|
      return t
    end

    transaction_one = Transaction.new(one_transaction)
    assert_equal 1, transaction_one.id
  end

  def test_find_invoice_id
    transact = CSV.open('./data/transactions.csv', headers: true, header_converters: :symbol)

    one_transaction = transact.each do |t|
      return t
    end

    transaction_one = Transaction.new(one_transaction)
    assert_equal 1, transaction_one.invoice_id
  end

  def test_find_credit_card_number
    transact = CSV.open('./data/transactions.csv', headers: true, header_converters: :symbol)

    one_transaction = transact.each do |t|
      return t
    end

    transaction_one = Transaction.new(one_transaction)
    assert_equal "4654405418249632", transaction_one.credit_card_number
  end

  def test_find_credit_card_expiration_date
    transact = CSV.open('./data/transactions.csv', headers: true, header_converters: :symbol)

    one_transaction = transact.each do |t|
      return t
    end

    transaction_one = Transaction.new(one_transaction)
    assert_equal " ", transaction_one.credit_card_expiration_date
  end

  def test_find_result
    transact = CSV.open('./data/transactions.csv', headers: true, header_converters: :symbol)

    one_transaction = transact.each do |t|
      return t
    end

    transaction_one = Transaction.new(one_transaction)
    assert_equal "success", transaction_one.result
  end

  def test_find_created_at
    transact = CSV.open('./data/transactions.csv', headers: true, header_converters: :symbol)

    one_transaction = transact.each do |t|
      return t
    end

    transaction_one = Transaction.new(one_transaction)
    assert_equal "2012-03-27 14:54:09 UTC", transaction_one.created_at
  end

  def test_find_updated_at
    transact = CSV.open('./data/transactions.csv', headers: true, header_converters: :symbol)

    one_transaction = transact.each do |t|
      return t
    end

    transaction_one = Transaction.new(one_transaction)
    assert_equal "2012-03-27 14:54:09 UTC", transaction_one.updated_at
  end
end
