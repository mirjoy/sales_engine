 require_relative '../data/customers'
 require_relative '../data/invoice_items'
 require_relative '../data/invoices'
 require_relative '../data/items'
 require_relative '../data/merchants'
 require_relative '../data/transactions'
 require_relative '../lib/customer'
 require_relative '../lib/customer_repo'
 require_relative '../lib/invoice_item'
 require_relative '../lib/invoice_item_repo'
 require_relative '../lib/invoice'
 require_relative '../lib/invoice_repo'
 require_relative '../lib/item'
 require_relative '../lib/item_repo'
 require_relative '../lib/merchant'
 require_relative '../lib/merchant_repo'
 require_relative '../lib/transaction'
 require_relative '../lib/transaction_repo'

 class SalesEngine

   def initialize
     @item_repo = ItemRepo.new('../data/items', self)
   end

   def startup
   end
 end

 # engine = SalesEngine.new
 # engine.startup
