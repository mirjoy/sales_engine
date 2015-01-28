require_relative './test_helper'
require_relative '../lib/sales_engine'

class SalesEngineTest < Minitest::Test
  attr_reader :sales_engine

  def setup
    @sales_engine = SalesEngine.new('.test/support')
  end

  def test_methods_exist
    assert sales_engine.customer_repository
    assert sales_engine.invoice_item_repository
    assert sales_engine.invoice_repository
    assert sales_engine.merchant_repository
    assert sales_engine.transaction_repository
    assert sales_engine.item_repository
  end
end
