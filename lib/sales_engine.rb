 require './data/customers'
 require './data/invoice_items'
 require './data/invoices'
 require './data/items'
 require './data/merchants'
 require './data/transactions'
 require './lib/customer'
 require './lib/customer_repo'
 require './lib/invoice_item'
 require './lib/invoice_item_repo'
 require './lib/invoice'
 require './lib/invoice_repo'
 require './lib/item'
 require './lib/item_repo'
 require './lib/merchant'
 require './lib/merchant_repo'
 require './lib/transaction'
 require './lib/transaction_repo'

 class SalesEngine
   def startup
     @invoice_items = CSV.open('./data/invoice_items.csv', headers: true, header_converters: :symbol)
   end
 end

 engine = SalesEngine.new
 engine.startup
