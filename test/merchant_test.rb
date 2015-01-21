require 'CSV'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/merchant'

class MerchantTest < Minitest::Test

  def test_it_exists
    assert Merchant
  end

  def test_find_id
    merchants = CSV.open('./data/merchants.csv', headers: true, header_converters: :symbol)

    one_mer = merchants.each do |mer|
      return mer
    end

    merchant = Merchant.new(one_mer)
    assert_equal 1, merchant.id
  end

  def test_find_name
    merchants = CSV.open('./data/merchants.csv', headers: true, header_converters: :symbol)
    one_mer = merchants.each do |mer|
      return mer
    end
    merchant = Merchant.new(one_mer)
    assert_equal "Schroeder-Jerde", merchant.name
  end

  def test_created_at
    merchants = CSV.open('./data/merchants.csv', headers: true, header_converters: :symbol)
    one_mer = merchants.each do |mer|
      return mer
    end
    merchant = Merchant.new(one_mer)
    assert_equal "2012-03-27 14:53:59 UTC", merchant.created_at
  end

  def test_updated_at
    merchants = CSV.open('./data/merchants.csv', headers: true, header_converters: :symbol)
    one_mer = merchants.each do |mer|
      return mer
    end
    merchant = Merchant.new(one_mer)
    assert_equal "2012-03-27 14:53:59 UTC", merchant.updated_at
  end

  def test_second_one
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
