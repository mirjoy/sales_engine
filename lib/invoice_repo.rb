require_relative '../lib/invoice_parser'

class InvoiceRepo
  attr_reader :all_invoices,
              :sales_engine

  def initialize(data, parent_class)
    @all_invoices = InvoiceParser.new(data, parent_class)
    @sales_engine = parent_class
  end

  def all
    all_invoices.parse
  end

  def random
    all.sample
  end

  def transactions(invoice_id)
    sales_engine.transaction_repository.find_all_by_invoice_id(invoice_id)
  end

  def invoice_items(invoice_id)
    sales_engine.invoice_item_repository.find_all_by_invoice_id(invoice_id)
  end

  def customer(invoice_id)
    sales_engine.customer_repository.find_by_invoice_id(invoice_id)
  end

  def merchant(invoice_id)
    sales_engine.merchant_repository.find_by_invoice_id(invoice_id)
  end

  def pending
    sales_engine.transaction_repository.find_all_by_result("failed")
  end

  def find_by_id(id)
    find_all_by_id(id)[0]
  end

  def find_by_customer_id(c_id)
    find_all_by_customer_id(c_id)[0]
  end

  def find_by_merchant_id(m_id)
    find_all_by_merchant_id(m_id)[0]
  end

  def find_by_status(stat)
    find_all_by_status(stat)[0]
  end

  def find_by_created_at(time)
    find_all_by_created_at(time)[0]
  end

  def find_by_updated_at(time)
    find_all_by_updated_at(time)[0]
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
    all.select do |invoice|
      invoice.created_at == time
    end
  end

  def find_all_by_updated_at(time)
    all.select do |invoice|
      invoice.updated_at == time
    end
  end

  def find_all_by_invoice_item_id(invoice_item_id)
    all.select do |invoice|
      invoice.id == invoice_item_id
    end
  end


end
