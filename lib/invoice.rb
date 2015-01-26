class Invoice
    attr_reader :id,
                :customer_id,
                :merchant_id,
                :status,
                :created_at,
                :updated_at
  attr_accessor :parent_class

  def initialize(row, parent_class)
    @id = row[:id].to_i
    @customer_id = row[:customer_id].to_i
    @merchant_id = row[:merchant_id].to_i
    @status = row[:status]
    @created_at = row[:created_at]
    @updated_at = row[:updated_at]
    @parent_class = parent_class
  end

  def successful_transactions_by_merchant(merch_id)
    (merch_id == merchant_id).all? do |transaction|
      transaction.status == "success"
    end
  end

end
