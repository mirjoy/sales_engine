require 'CSV'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/merchant'

class MerchantTest < Minitest::Test

  def test_it_exists
    assert Merchant
  end

  def test_it_stores_an_id
    merchant = Merchant.new({:id => 6}, nil)
    assert_equal 6, merchant.id
  end

  def test_it_stores_ids_as_integers_only
    merchant = Merchant.new({:id => '6'}, nil)
    assert_equal 6, merchant.id
  end

  def test_it_stores_a_name
    merchant = Merchant.new({:name => 'John'}, nil)
    assert_equal "John", merchant.name
  end

end
