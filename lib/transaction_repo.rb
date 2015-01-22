require_relative '../lib/transaction_parser'

class TransactionRepo
  attr_reader :all_transactions,
              :search_engine

  def initialize(data, parent_class)
    @all_transactions = TransactionParser.new(data, parent_class)
    @search_engine = parent_class
  end

  def all
    all_transactions.parse
  end

  def random
    all.sample
  end

  def find_by_id(id)
    find_all_by_id(id)[0]
  end

  def find_by_invoice_id(i_id)
    find_all_by_invoice_id(i_id)[0]
  end

  def find_by_credit_card_number(cc)
    find_all_by_credit_card_number(cc)[0]
  end

  def find_by_credit_card_expiration_date(cc)
    find_all_by_credit_card_expiration_date(cc)[0]
  end

  def find_by_result(status)
    find_all_by_result(status)[0]
  end

  def find_by_created_at(time)
    find_all_by_created_at(time)[0]
  end

  def find_by_updated_at(time)
    find_all_by_updated_at(time)[0]
  end

  def find_all_by_id(id)
    all.find_all do |transact|
      transact.id == id
    end
  end

  def find_all_by_invoice_id(id)
    all.find_all do |transact|
      transact.invoice_id == id
    end
  end

  def find_all_by_credit_card_number(cc)
    all.find_all do |transact|
      transact.credit_card_number == cc
    end
  end

  def find_all_by_credit_card_expiration_date(cc)
    all.find_all do |transact|
      transact.merchant_id == cc
    end
  end

  def find_all_by_result(status)
    all.find_all do |transact|
      transact.result == status
    end
  end

  def find_all_by_created_at(time)
    all.find_all do |transact|
      transact.created_at == time
    end
  end

  def find_all_by_updated_at(time)
    all.find_all do |transact|
      transact.updated_at == time
    end
  end

end
