require 'csv'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/merchant_repo'


class MerchantRepoTest < Minitest::Test
  attr_accessor :merchant_repo

  def setup
    file = "./test/support/sample_merchants.csv"
    @merchant_repo = MerchantRepo.new(file, nil)
  end

  def test_it_exists
    assert MerchantRepo
  end

  def test_it_finds_all_merchants
    assert_equal "Schroeder-Jerde", merchant_repo.all[0].name
  end

  def test_it_finds_the_third_merchant
    assert_equal "Cummings-Thiel", merchant_repo.all[3].name
  end

  def test_it_finds_merchant_by_name_case_insensitively
    merch = merchant_repo.find_by_name("cummings-Thiel")
    assert_equal "Cummings-Thiel", merch[0].name
  end

  def test_it_finds_merchant_by_id
    merch = merchant_repo.find_by_id(4)
    assert_equal "Cummings-Thiel", merch[0].name
  end

  def test_it_finds_a_random_merchant
    assert merchant_repo.random
  end

end
