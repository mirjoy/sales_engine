require_relative './test_helper'
require_relative '../lib/sales_engine'

class SalesEngineTest < Minitest::Test
  attr_reader :sales_engine
  # :customer_repo,
  #             :invoice_item_repo,
  #             :invoice_repo,
  #             :item_repo,
  #             :merchant_repo,
  #             :transaction_repo,


  def setup
    @sales_engine = SalesEngine.new
  end

  def test_methods_exist
    skip
    assert sales_engine.customer_repo
    assert sales_engine.invoice_item_repo
    assert sales_engine.invoice_repo
    assert sales_engine.merchant_repo
    assert sales_engine.transaction_repo
    assert sales_engine.item_repo
  end
end
