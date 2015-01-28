class Invoice
    attr_reader :id,
                :customer_id,
                :merchant_id,
                :status,
                :created_at,
                :updated_at,
                :sales_engine

  def initialize(row, parent_class)
    @id = row[:id].to_i
    @customer_id = row[:customer_id].to_i
    @merchant_id = row[:merchant_id].to_i
    @status = row[:status]
    @created_at = Date.parse(row[:created_at])
    @updated_at = Date.parse(row[:updated_at])
    @sales_engine = parent_class
  end

  def successful_transactions_by_merchant(merch_id)

  end

  def customer
    sales_engine.customer_repository.find_by_id(@customer_id)
  end

  def transactions
    sales_engine.transaction_repository.find_all_by_invoice_id(@id)
  end

  def items
    inv_items = sales_engine.invoice_item_repository.find_all_by_invoice_id(@id)
    item_ids = inv_items.map {|inv_item| inv_item.item_id}
    item_ids.map {|it_id| sales_engine.item_repository.find_by_id(it_id)}
  end

  def invoice_items
    sales_engine.invoice_item_repository.find_all_by_invoice_id(@id)
  end

  def charge

  end

  def amount
    invoice_items.reduce(0) do |sum, invoice_item|
      sum + (invoice_item.unit_price * invoice_item.quantity)
    end
  end
end
