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
   attr_reader :customer_repo,
               :invoice_item_repo,
               :invoice_repo,
               :item_repo,
               :merchant_repo,
               :transaction_repo

   def initialize
     @customer_repo = CustomerRepo.new('../data/customers', self)
     @invoice_item_repo = InvoiceItemRepo.new('../data/invoice_items', self)
     @invoice_repo = InvoiceRepo.new('../data/invoices', self)
     @item_repo = ItemRepo.new('../data/items', self)
     @merchant_repo = MerchantRepo.new('../data/merchants', self)
     @transaction_repo = TransactionRepo.new('../data/transactions', self)
   end

   def startup
   end
 end

 # engine = SalesEngine.new
 # engine.startup
