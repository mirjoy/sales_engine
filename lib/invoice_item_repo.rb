require_relative '../lib/invoice_item_parser'

class InvoiceItemRepo
  attr_reader :all_invoice_items,
  :search_engine

  def initialize(data, parent_class)
    @all_invoice_items = InvoiceItemParser.new(data, parent_class)
    @search_engine = parent_class
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
    all.select do |transact|
      transact.id == id
    end
  end

  def find_all_by_invoice_id(id)
    all.select do |transact|
      transact.invoice_id == id
    end
  end

  def find_all_by_quantity(num)
    all.select do |transact|
      transact.quantity == num
    end
  end

  def find_all_by_unit_price(num)
    all.select do |transact|
      transact.unit_price == num
    end
  end

  def find_all_by_created_at(time)
    all.select do |transact|
      transact.created_at == time
    end
  end

  def find_all_by_updated_at(time)
    all.select do |transact|
      transact.updated_at == time
    end
  end

end
