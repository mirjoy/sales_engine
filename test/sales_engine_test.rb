require_relative './test_helper'
require_relative '../lib/sales_engine'

class SalesEngineTest < Minitest::Test
  attr_reader :sales_engine

  def setup
    @sales_engine = SalesEngine.new
  end

  def test_methods_exist
    skip
    assert sales_engine.startup.customer_repo
    assert sales_engine.startup.invoice_item_repo
    assert sales_engine.startup.invoice_repo
    assert sales_engine.startup.merchant_repo
    assert sales_engine.startup.transaction_repo
    assert sales_engine.startup.item_repo
  end
end
