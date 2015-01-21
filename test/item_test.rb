require 'CSV'
require './lib/item'
require 'minitest/autorun'
require 'minitest/pride'

class ItemTest < Minitest::Test

  def test_it_exists
    assert Item
  end

  def test_find_id
    items = CSV.open('./data/items.csv', headers: true, header_converters: :symbol)
    one_item = items.each do |item|
      return item
    end
    item = Item.new(one_item)
    assert_equal 1, item.id
  end

  def test_find_name
    items = CSV.open('./data/items.csv', headers: true, header_converters: :symbol)
    one_item = items.each do |item|
      return item
    end
    item = Item.new(one_item)
    assert_equal "Item Qui Esse", item.name
  end

  def test_find_description
    items = CSV.open('./data/items.csv', headers: true, header_converters: :symbol)
    one_item = items.each do |item|
      return item
    end
    item = Item.new(one_item)
    assert_equal "Nihil autem sit odio inventore deleniti", item.description
  end

  def test_find_unit_price
    items = CSV.open('./data/items.csv', headers: true, header_converters: :symbol)
    one_item = items.each do |item|
      return item
    end
    item = Item.new(one_item)
    assert_equal "Est laudantium ratione distinctio laborum", item.unit_price
  end

  def test_find_merchant_id
    items = CSV.open('./data/items.csv', headers: true, header_converters: :symbol)
    one_item = items.each do |item|
      return item
    end
    item = Item.new(one_item)
    assert_equal "Minus voluptatem nesciunt assumenda dicta voluptatum porro", item.merchant_id
  end

  def test_created_at
    items = CSV.open('./data/items.csv', headers: true, header_converters: :symbol)
    one_item = items.each do |item|
      return item
    end
    item = Item.new(one_item)
    assert_equal "75107,1,2012-03-27 14:53:59 UTC", item.created_at
  end

  def test_updated_at
    items = CSV.open('./data/items.csv', headers: true, header_converters: :symbol)
    one_item = items.each do |item|
      return item
    end
    item = Item.new(one_item)
    assert_equal "2012-03-27 14:53:59 UTC", item.updated_at
  end

  def test_second_one
    items = CSV.open('./data/items.csv', headers: true, header_converters: :symbol)
    count = 0

    one_item = items.each do |item|
      count += 1
      if count == 2
        return item
      end
    end

    item = Item.new(one_item)
    assert_equal 2, item.id
  end
end
