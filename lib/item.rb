require 'bigdecimal'

class Item
    attr_reader :id,
                :name,
                :description,
                :unit_price,
                :merchant_id,
                :created_at,
                :updated_at,
                :sales_engine

  def initialize(row, parent_class)
    @id = row[:id].to_i
    @name = row[:name]
    @description = row[:description]
    @unit_price = BigDecimal.new(row[:unit_price])/100
    @merchant_id = row[:merchant_id].to_i
    @created_at = row[:created_at]
    @updated_at = row[:updated_at]
    @sales_engine = parent_class
  end

  def merchant
    sales_engine.merchant_repository.find_by_id(@merchant_id)
  end

  def invoice_items
    sales_engine.invoice_item_repository.find_all_by_item_id(@id)
  end

  def best_day

  end
end
