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

  def find_by_id(m_id)
    all_ids = all_invoices.parse.select do |invoice|
      invoice.id == m_id
    end
    all_ids[0]
  end

  def find_by_customer_id(m_id)
    all_ids = all_invoices.parse.select do |invoice|
      invoice.customer_id == m_id
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
    all_stats = all_invoices.parse.select do |invoice|
      invoice.status == stat
    end
    all_stats[0]
  end

  def find_by_created_at(time)
    each_invoice = all_invoices.parse.select do |invoice|
      invoice.created_at == time
    end
    each_invoice[0]
  end

  def find_by_updated_at(time)
    each_invoice = all_invoices.parse.select do |invoice|
      invoice.updated_at == time
    end
    each_invoice[0]
  end

  def find_all_by_id(m_id)
    all_invoices.parse.select do |invoice|
      invoice.id == m_id
    end
  end

  def find_all_by_customer_id(m_id)
    all_invoices.parse.select do |invoice|
      invoice.customer_id == m_id
    end
  end

  def find_all_by_merchant_id(m_id)
    all_invoices.parse.select do |invoice|
      invoice.merchant_id == m_id
    end
  end

  def find_all_by_status(stat)
    all_invoices.parse.select do |invoice|
      invoice.status == stat
    end
  end

  def find_all_by_created_at(time)
    all_invoices.parse.select do |merchant|
      merchant.created_at == time
    end
  end

  def find_all_by_updated_at(time)
    all_invoices.parse.select do |merchant|
      merchant.updated_at == time
    end
  end

end
