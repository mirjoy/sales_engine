class Merchant
    attr_reader :id,
                :name,
                :created_at,
                :updated_at
  attr_accessor :merchant_parser

  def initialize(row, parent_class)
    @id = row[:id].to_i
    @name = row[:name]
    @created_at = row[:created_at]
    @updated_at = row[:updated_at]
    @merchant_parser = parent_class
  end
end
