require 'CSV'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/merchant_parser'
require_relative '../lib/invoice'

class MerchantParserTest < Minitest::Test

  def test_it_exists
    assert MerchantParser
  end

  def test_it_parses_a_csv_of_data
    filename = "./test/support/sample_merchants.csv"
    parser = MerchantParser.new(filename, nil)
    merchants = parser.parse

    first = merchants.first
    assert_equal 1, first.id
    assert_equal "Schroeder-Jerde", first.name

    second = merchants[1]
    assert_equal 2, second.id
    assert_equal "Klein, Rempel and Jones", second.name
    end
end

class FakeMerchantRepository
  attr_accessor :invoices

  def find_invoices_by_merchant_id(id)
    @invoices
  end
end

class MerchantIntegrationTest < Minitest::Test

  def test_it_finds_related_orders
    skip
    @merchant_repo = FakeMerchantRepository.new
    data = {:name => "My Shop"}
    @merchant = Merchant.new(data, @merchant_repo)
    invoice = Array.new(5){ Invoice.new(:hi => "moarstuff")}
    @merchant_repo.invoices = invoice
    assert_equal invoice, @merchant.invoices
  end

end
