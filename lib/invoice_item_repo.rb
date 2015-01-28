require_relative '../lib/invoice_item_parser'

class InvoiceItemRepo
  attr_reader :all_invoice_items,
              :sales_engine

  def initialize(data, parent_class)
    @all_invoice_items = InvoiceItemParser.new(data, parent_class)
    @sales_engine = parent_class
  end

  def all
    all_invoice_items.parse
  end

  def random
    all.sample
  end

  def find_by_id(id)
    find_all_by_id(id)[0]
  end

  def find_by_item_id(i_id)
    find_all_by_item_id(i_id)[0]
  end

  def find_by_invoice_id(num)
    find_all_by_invoice_id(num)[0]
  end

  def find_by_quantity(num)
    find_all_by_quantity(num)[0]
  end

  def find_by_unit_price(price)
    find_all_by_unit_price(price)[0]
  end

  def find_by_created_at(time)
    find_all_by_created_at(time)[0]
  end

  def find_by_updated_at(time)
    find_all_by_updated_at(time)[0]
  end

  def find_all_by_id(id)
    all.find_all do |inv_item|
      inv_item.id == id
    end
  end

  def find_all_by_item_id(id)
    all.find_all do |inv_item|
      inv_item.item_id == id
    end
  end

  def find_all_by_invoice_id(id)
    all.find_all do |inv_item|
      inv_item.invoice_id == id
    end
  end

  def find_all_by_quantity(num)
    all.find_all do |inv_item|
      inv_item.quantity == num
    end
  end

  def find_all_by_unit_price(num)
    all.find_all do |inv_item|
      inv_item.unit_price == num
    end
  end

  def find_all_by_created_at(time)
    all.find_all do |inv_item|
      inv_item.created_at == time
    end
  end

  def find_all_by_updated_at(time)
    all.find_all do |inv_item|
      inv_item.updated_at == time
    end
  end

end
