require 'csv'
require_relative '../lib/item'

class ItemParser
  attr_reader   :filename

  def initialize(filename, parent_class)
    @filename = filename
    @parent_class = parent_class
  end

  def parse
    file = CSV.open(filename, headers: true, header_converters: :symbol)
    file.map do |line|
      Item.new(line, @parent_class)
    end
  end

end
