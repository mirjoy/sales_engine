require 'bigdecimal'

class InvoiceItem
    attr_reader :id,
                :item_id,
                :invoice_id,
                :quantity,
                :unit_price,
                :created_at,
                :updated_at,
                :sales_engine

  def initialize(row, parent_class)
    @id = row[:id].to_i
    @item_id = row[:item_id].to_i
    @invoice_id = row[:invoice_id].to_i
    @quantity = row[:quantity].to_i
    @unit_price = BigDecimal.new(row[:unit_price].to_i)
    @created_at = row[:created_at]
    @updated_at = row[:updated_at]
    @sales_engine = parent_class
  end

  def invoice
    sales_engine.invoice_repository.find_by_id(@invoice_id)
  end

  def item
    sales_engine.item_repository.find_by_id(@item_id)
  end

end
