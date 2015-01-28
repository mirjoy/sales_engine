class Merchant
    attr_reader :id,
                :name,
                :created_at,
                :updated_at,
                :sales_engine

  def initialize(row, parent_class)
    @id = row[:id].to_i
    @name = row[:name]
    @created_at = row[:created_at]
    @updated_at = row[:updated_at]
    @sales_engine = parent_class
  end


  def items
    sales_engine.item_repository.find_all_by_merchant_id(@id)
  end

  def invoices
    sales_engine.invoice_repository.find_all_by_merchant_id(@id)
  end


  def customers
    invoice_ids_related_to_one_merchant.map do |invoice_id|
      sales_engine.invoice_repository.customer(invoice_id)
    end
  end

  def invoice_ids_related_to_one_merchant
    invoices.map do |inv|
      inv.id
    end
  end

  def all_transactions
    invoice_ids_related_to_one_merchant.map do |invoice_id|
      sales_engine.transaction_repository.find_all_by_invoice_id(invoice_id)
    end
  end

  def all_failed_transactions
    all_transactions_related_to_one_merchant.all do |trans|
      trans.result("failed")
    end
  end

  def customer_has_failed_result?(cust)
    #search all of customers results
    # as soon as it finds failed, return true
    # binding.pry
    trans.result == "failed"
  end

  # def customers_with_pending_invoices
  #   customers.flatten.reduce([]) do |bad_customers, cust|
  #     if customer_has_failed_result?(cust)
  #       bad_customers << cust
  #     end
  #   end
  # end

  def favorite_customer

  end

  def successful_transactions
    find_all_transactions_related_to_one_merchant - find_all_failed_transactions_related_to_one_merchant
  end

  def revenue(date=nil)
    # successful_transactions are transaction objects
    # need to find invoice_item_id, so we can calculate revenue
    successful_transactions.map do |transaction|
      item_id = sales_engine.invoice_item_repository.find_all_by_invoice_id(transaction.invoice_id)
      sales_engine.invoice_item_repository.find_all_by_i.unit_price * transaction.quantity
    end
  end

end
