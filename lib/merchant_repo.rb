require_relative '../lib/merchant_parser'

class MerchantRepo
  attr_reader :all_merchants,
              :search_engine

  def initialize(data, parent_class)
    @all_merchants = MerchantParser.new(data, parent_class)
    @search_engine = parent_class
  end

  def all
    all_merchants.parse
  end

  def random
    all_merchants.parse.sample
  end

  def find_by_id(m_id)
    find_all_by_id(m_id)[0]
  end

  def find_by_name(lname)
    find_all_by_name(lname)[0]
  end

  def find_by_created_at(time)
    find_all_by_created_at(time)[0]
  end

  def find_by_updated_at(time)
    find_all_by_updated_at(time)[0]
  end

  def find_all_by_id(m_id)
    all_merchants.parse.select do |merchant|
      merchant.id == m_id
    end
  end

  def find_all_by_name(lname)
    all_merchants.parse.select do |merchant|
        merchant.name.downcase == lname.downcase
      end
  end

  def find_all_by_created_at(time)
    all_merchants.parse.select do |merchant|
      merchant.created_at == time
    end
  end

  def find_all_by_updated_at(time)
    all_merchants.parse.select do |merchant|
      merchant.updated_at == time
    end
  end

  #most_revenue(x) returns top merchant instances ranked by total revenue
  #most_items(x) reutnrs top merchant instances ranked by total number of items sold
  #revenue(date) returns total revenue for that date across all merchants
end
