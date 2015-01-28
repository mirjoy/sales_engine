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
    sales_engine.invoice_item_repository.find_all_by_invoice_id(id)
  end

  def merchant(merchant_id)
    sales_engine.merchant_repository.find_all_by_id(merchant_id)
  end

  def find_by_id(i_id)
    find_all_by_id(i_id)[0]
  end

  def find_by_name(lname)
    find_all_by_name(lname)[0]
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

  def find_all_by_id(item_id)
    all.find_all do |item|
      item.id == item_id
    end
  end

  def find_all_by_name(last_name)
    all.find_all do |item|
      item.name.downcase == last_name.downcase
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

  def find_all_by_invoice_item_id(invoice_item_id)
    all.find_all do |item|
      item.id == invoice_item_id
    end
  end

  def find_by_unit_price(price)
    find_all_by_unit_price(price)[0]
  end

  def find_all_by_unit_price(price)
    all.find_all do |item|
      item.unit_price == price
    end
  end
end
