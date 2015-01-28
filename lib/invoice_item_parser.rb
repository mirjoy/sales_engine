require 'csv'
require_relative '../lib/invoice_item'

class InvoiceItemParser
  attr_reader   :filename

  def initialize(filename, parent_class)
    @filename = filename
    @parent_class = parent_class
  end

  def parse
    file = CSV.open(filename, headers: true, header_converters: :symbol)
    file.map do |line|
      InvoiceItem.new(line, @parent_class)
    end
  end

end
