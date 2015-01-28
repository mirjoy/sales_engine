class Customer
    attr_reader :id,
                :first_name,
                :last_name,
                :created_at,
                :updated_at,
                :sales_engine

  def initialize(row, parent_class)
    @id = row[:id].to_i
    @first_name = row[:first_name]
    @last_name  = row[:last_name]
    @created_at = row[:created_at]
    @updated_at = row[:updated_at]
    @sales_engine = parent_class
  end

  def invoices
    sales_engine.invoice_repository.find_all_by_customer_id(@id)
  end
end
