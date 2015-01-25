require_relative '../lib/item_parser'
require 'pry'

class ItemRepo
  attr_reader :all_items,
              :sales_engine

  def initialize(data, parent_class)
    @all_items = ItemParser.new(data, parent_class)
    @sales_engine = parent_class
  end

  def all
    all_items.parse
  end

  def random
    all_items.parse.sample
  end

  def invoice_items(id)
    sales_engine.invoice_item_repo.find_all_by_invoice_id(id)
  end

  def merchant(merchant_id)
    sales_engine.merchant_repo.find_all_by_id(merchant_id)
  end

  def find_by_id(i_id)
    find_all_by_id[0]
  end

  def find_by_name(lname)
    find_all_by_name[0]
  end

  def find_by_description(desc)
    find_all_by_description(desc)
  end

  def find_by_merchant_id(m_id)
    find_all_by_merchant_id(m_id)[0]
  end

  def find_by_created_at(time)
    find_all_by_created_at(time)[0]
  end

  def find_by_updated_at(time)
    find_all_by_updated_at(time)[0]
  end

  def find_all_by_id(i_id)
    all.find_all do |item|
      item.id == i_id
    end
  end

  def find_all_by_name(lname)
    all.find_all do |item|
      item.name.downcase == lname.downcase
    end
  end

  def find_all_by_description(desc)
    all.find_all do |item|
      item.description.downcase == desc.downcase
    end
  end

  def find_all_by_unit_price(unit_price)
    all.find_all do |item|
      item.unit_price == unit_price
    end
  end

  def find_all_by_merchant_id(m_id)
    all.find_all do |item|
      item.merchant_id == m_id
    end
  end

  def find_all_by_created_at(time)
    all.find_all do |item|
      item.created_at == time
    end
  end

  def find_all_by_updated_at(time)
    all.find_all do |item|
      item.updated_at == time
    end
  end

  #find_by_x() CHECK
  #fina_all_by_x() CHECK
  #most_revenue(x) returns top item instances ranked by total revenue
  #most_items(x) reutnrs top item instances ranked by total number of items sold
  #revenue(date) returns total revenue for that date across all items
end
