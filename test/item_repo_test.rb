require_relative './test_helper'
require_relative '../lib/item_repo'
require_relative '../lib/invoice_item_repo'
require_relative '../lib/merchant_repo'

class ItemRepoTest < Minitest::Test
  attr_accessor :item_repo

  def setup
    file = "./test/support/items.csv"
    @item_repo = ItemRepo.new(file, nil)
  end

  def test_it_exists
    assert ItemRepo
  end

  def test_it_finds_all_items
    assert_equal "Item Qui Esse", item_repo.all[0].name
  end

  def test_it_finds_the_third_item
    assert_equal "Item Nemo Facere", item_repo.all[3].name
  end

  def test_it_finds_all_by_merchant_id
    items = item_repo.find_all_by_merchant_id(1)
    assert_equal 6, items.count
  end

  def test_it_finds_all_items_by_name_case_insensitively
    item = item_repo.find_all_by_name("ITem NeMo Facere")
    assert_equal "Item Nemo Facere", item[0].name
    assert_equal 2, item.count
  end

  def test_it_finds_all_items_by_description
    item = item_repo.find_all_by_description("Sunt eum id eius magni consequuntur delectus veritatis. Quisquam laborum illo ut ab. Ducimus in est id voluptas autem.")
    assert_equal "Item Nemo Facere", item[0].name
    assert_equal 2, item.count
  end

  def test_it_finds_all_items_by_unit_price
    item = item_repo.find_all_by_unit_price(42.91)
    assert_equal "Item Nemo Facere", item[0].name
    assert_equal 2, item.count
  end

  def test_it_finds_all_items_by_id
    item = item_repo.find_all_by_id(4)
    assert_equal "Item Nemo Facere", item[0].name
    assert_equal 2, item.count
  end

  def test_it_finds_a_random_item
    assert item_repo.random
  end

  def test_it_finds_item_by_created_at
    item = item_repo.find_all_by_created_at("2012-03-27 14:53:59 UTC")
    assert_equal 6, item.count
  end

  def test_it_finds_item_by_updated_at
    item = item_repo.find_all_by_updated_at("2012-03-27 14:53:59 UTC")
    assert_equal 6, item.count
  end
end

class ItemIntegrationTest < Minitest::Test
  attr_reader :sales,
              :item_repository,
              :invoice_item_repository,
              :merchant_repository

  def setup
    @sales = SalesEngine.new("./test/support")
    @item_repository = ItemRepo.new('./test/support/items.csv', sales)
    @invoice_item_repository = InvoiceItemRepo.new('./test/support/invoice_items.csv', sales)
    @merchant_repository = MerchantRepo.new('./test/support/merchants.csv', sales)
  end

  def test_invoice_items
    num = item_repository.invoice_items(1)
    assert_equal 5, num.count
  end

  def test_merchant
    num = item_repository.merchant(1)
    assert_equal 1, num.count
  end
end
