require 'CSV'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/merchant_parser'

class MerchantParserTest < Minitest::Test

  def test_it_exists
    assert MerchantParser
  end

  def test_it_parses_a_csv_of_data
    filename = "./test/support/sample_merchants.csv"
    parser = MerchantParser.new(filename)
    merchants = parser.parse

    first = merchants.first
    assert_equal 1, first.id
    assert_equal "Schroeder-Jerde", first.name

    second = merchants[1]
    assert_equal 2, second.id
    assert_equal "Klein, Rempel and Jones", second.name
    end

  def test_find_id
    skip
    merchants = CSV.open('./data/merchants.csv', headers: true, header_converters: :symbol)

    one_mer = merchants.each do |mer|
      return mer
    end

    merchant = Merchant.new(one_mer)
    assert_equal 1, merchant.id
  end

  def test_find_name
    skip
    merchants = CSV.open('./data/merchants.csv', headers: true, header_converters: :symbol)
    one_mer = merchants.each do |mer|
      return mer
    end
    merchant = Merchant.new(one_mer)
    assert_equal "Schroeder-Jerde", merchant.name
  end

  def test_created_at
    skip
    merchants = CSV.open('./data/merchants.csv', headers: true, header_converters: :symbol)
    one_mer = merchants.each do |mer|
      return mer
    end
    merchant = Merchant.new(one_mer)
    assert_equal "2012-03-27 14:53:59 UTC", merchant.created_at
  end

  def test_updated_at
    skip
    merchants = CSV.open('./data/merchants.csv', headers: true, header_converters: :symbol)
    one_mer = merchants.each do |mer|
      return mer
    end
    merchant = Merchant.new(one_mer)
    assert_equal "2012-03-27 14:53:59 UTC", merchant.updated_at
  end

  def test_second_one
    skip
    merchants = CSV.open('./data/merchants.csv', headers: true, header_converters: :symbol)
    count = 0

    one_mer = merchants.each do |mer|
      count += 1
      if count == 2
        return mer
      end
    end

    merchant = Merchant.new(one_mer)
    assert_equal 2, merchant.id
  end
end
