class Customer
  attr_reader :id,
              :first_name,
              :last_name,
              :created_at,
              :updated_at
  attr_accessor :customer_parser

  def initialize(row, parent_class)
    @id = row[:id].to_i
    @first_name = row[:first_name]
    @last_name  = row[:last_name]
    @created_at = row[:created_at]
    @updated_at = row[:updated_at]
    @customer_parser = parent_class
  end
end
