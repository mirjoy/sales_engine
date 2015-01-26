require_relative './test_helper'
require_relative '../lib/item_repo'


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
    item = item_repo.find_all_by_unit_price(4291)
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

class ItemRepoIntegrationTest < Minitest::Test

  def test_invoice_items
    skip
  end

  def test_merchant
    skip
  end

end
