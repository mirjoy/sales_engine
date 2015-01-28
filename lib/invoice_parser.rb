require 'csv'
require_relative '../lib/invoice'

class InvoiceParser
  attr_reader   :filename

  def initialize(filename, parent_class)
    @filename = filename
    @parent_class = parent_class
  end

  def parse
    file = CSV.open(filename, headers: true, header_converters: :symbol)
    file.map do |line|
      Invoice.new(line, @parent_class)
    end
  end

end
