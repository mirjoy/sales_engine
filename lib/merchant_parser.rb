require 'csv'
require_relative '../lib/merchant'

class MerchantParser
  attr_reader   :filename
  attr_accessor :merchant_repo

  def initialize(filename, parent_class)
    @filename = filename
    @merchant_repo = parent_class
  end

  def parse
    file = CSV.open(filename, headers: true, header_converters: :symbol)
    file.map do |line|
      Merchant.new(line, merchant_repo)
    end
  end

end
