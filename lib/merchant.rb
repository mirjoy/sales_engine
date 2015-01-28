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

  def customers_with_pending_invoices

  end

  def favorite_customer

  end

  def revenue
    if sales_engine.invoices.merchant_id == id &&
      sales_engine.invoices.status == "success"
    end
  end


end
