require 'csv'
require_relative '../lib/item'

class ItemParser
  attr_reader   :filename
  attr_accessor :item_repo

  def initialize(filename, parent_class)
    @filename = filename
    @item_repo = parent_class
  end

  def parse
    file = CSV.open(filename, headers: true, header_converters: :symbol)
    file.map do |line|
      Item.new(line, item_repo)
    end
  end

end
