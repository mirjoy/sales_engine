class Transaction
    attr_reader :id,
                :invoice_id,
                :credit_card_number,
                :credit_card_expiration_date,
                :result,
                :created_at,
                :updated_at,
                :sales_engine

  def initialize(row, sales_engine)
    @id = row[:id].to_i
    @invoice_id = row[:invoice_id].to_i
    @credit_card_number = row[:credit_card_number]
    @credit_card_expiration_date = row[:credit_card_expiration_date]
    @result = row[:result]
    @created_at = row[:created_at]
    @updated_at = row[:updated_at]
    @sales_engine = sales_engine
  end

  def invoice
    sales_engine.invoice_repository.find_by_id(@invoice_id)
  end

end
