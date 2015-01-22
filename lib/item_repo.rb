require_relative '../lib/item_parser'
require 'pry'

class ItemRepo
  attr_reader :all_items,
              :search_engine

  def initialize(data, parent_class)
    @all_items = ItemParser.new(data, parent_class)
    @search_engine = parent_class
  end

  def all
    all_items.parse
  end

  def random
    all_items.parse.sample
  end

  def find_by_id(i_id)
    all_ids = all_items.parse.select do |item|
      item.id == i_id
    end
    all_ids[0]
  end

  def find_by_name(lname)
    all_names = all_items.parse.select do |item|
      item.name.downcase == lname.downcase
    end
    all_names[0]
  end

  def find_all_by_description(i_description)
    all_descriptions = all_items.parse.select do |item|
      item.description.downcase == i_description.downcase
    end
  end

  def find_all_by_unit_price(unit_price)
    all_unit_prices = all_items.parse.select do |item|
      item.unit_price.downcase == unit_price.downcase
    end
  end

  def find_by_created_at(time)
    all_items = all_items.parse.select do |item|
      item.created_at == time
    end
    all_items[0]
  end

  def find_by_updated_at(time)
    all_items = all_items.parse.select do |item|
      item.updated_at == time
    end
    all_items[0]
  end

  def find_all_by_id(i_id)
    all_items.parse.select do |item|
      item.id == i_id
    end
  end

  def find_all_by_name(lname)
    all_items.parse.select do |item|

      item.name.downcase == lname.downcase
    end
  end

  def find_all_by_created_at(time)
    all_items.parse.select do |item|
      item.created_at == time
    end
  end

  def find_all_by_updated_at(time)
    all_items.parse.select do |item|
      item.updated_at == time
    end
  end

  #find_by_x() CHECK
  #fina_all_by_x() CHECK
  #most_revenue(x) returns top item instances ranked by total revenue
  #most_items(x) reutnrs top item instances ranked by total number of items sold
  #revenue(date) returns total revenue for that date across all items
end
