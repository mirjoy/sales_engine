require 'bigdecimal'
class Item
  attr_reader :id,
              :name,
              :description,
              :unit_price,
              :merchant_id,
              :created_at,
              :updated_at
  attr_accessor :item_parser

  def initialize(row, parent_class)
    @id = row[:id].to_i
    @name = row[:name]
    @description = row[:description]
    @unit_price = BigDecimal.new(row[:unit_price])
    @merchant_id = row[:merchant_id].to_i
    @created_at = row[:created_at]
    @updated_at = row[:updated_at]
    @item_parser = parent_class
  end
end
