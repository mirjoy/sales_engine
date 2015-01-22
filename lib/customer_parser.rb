require 'csv'
require_relative '../lib/customer'

class CustomerParser
  attr_reader   :filename
  attr_accessor :customer_repo

  def initialize(filename, parent_class)
    @filename = filename
    @customer_repo = parent_class
  end

  def parse
    file = CSV.open(filename, headers: true, header_converters: :symbol)
    file.map do |line|
      Customer.new(line, customer_repo)
    end
  end

end
