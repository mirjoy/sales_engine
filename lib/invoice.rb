class Invoice
    attr_reader :id,
                :customer_id,
                :merchant_id,
                :status,
                :created_at,
                :updated_at
  attr_accessor :invoice_parser

  def initialize(row, parent_class=nil)
    @id = row[:id]
    @customer_id = row[:customer_id]
    @merchant_id = row[:merchant_id]
    @status = row[:status]
    @created_at = row[:created_at]
    @updated_at = row[:updated_at]
    @invoice_parser = parent_class
  end

end
