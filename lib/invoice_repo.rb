require_relative '../lib/invoice_parser'

class InvoiceRepo
  attr_reader :all_invoices,
              :search_engine

  def initialize(data, parent_class)
    @all_invoices = InvoiceParser.new(data, parent_class)
    @search_engine = parent_class
  end

  def all
    all_invoices.parse
  end

  def random
    all_invoices.parse.sample
  end

  def find_by_id(id)
    all_ids = all.select do |invoice|
      invoice.id == id
    end
    all_ids
  end

  def find_by_customer_id(c_id)
    all_ids = all.select do |invoice|
      invoice.customer_id == c_id
    end
    all_ids[0]
  end

  def find_by_merchant_id(m_id)
    all_ids = all_invoices.parse.select do |invoice|
      invoice.merchant_id == m_id
    end
    all_ids[0]
  end

  def find_by_status(stat)
    all_stats = all.select do |invoice|
      invoice.status == stat
    end
    all_stats[0]
  end

  def find_by_created_at(time)
    each_invoice = all.select do |invoice|
      invoice.created_at == time
    end
    each_invoice[0]
  end

  def find_by_updated_at(time)
    each_invoice = all.select do |invoice|
      invoice.updated_at == time
    end
    each_invoice[0]
  end

  def find_all_by_id(id)
    all.select do |invoice|
      invoice.id == id
    end
  end

  def find_all_by_customer_id(c_id)
    all.select do |invoice|
      invoice.customer_id == c_id
    end
  end

  def find_all_by_merchant_id(m_id)
    all.select do |invoice|
      invoice.merchant_id == m_id
    end
  end

  def find_all_by_status(stat)
    all.select do |invoice|
      invoice.status == stat
    end
  end

  def find_all_by_created_at(time)
    all.select do |merchant|
      merchant.created_at == time
    end
  end

  def find_all_by_updated_at(time)
    all.select do |merchant|
      merchant.updated_at == time
    end
  end

end
