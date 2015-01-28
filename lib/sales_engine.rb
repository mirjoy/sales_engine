 require_relative '../lib/customer_repo'
 require_relative '../lib/invoice_item_repo'
 require_relative '../lib/invoice_repo'
 require_relative '../lib/item_repo'
 require_relative '../lib/merchant_repo'
 require_relative '../lib/transaction_repo'

 class SalesEngine
   attr_accessor :customer_repository,
                 :invoice_item_repository,
                 :invoice_repository,
                 :transaction_repository,
                 :merchant_repository,
                 :item_repository

   def initialize(dir)
     @customer_repository = CustomerRepo.new("#{dir}/customers.csv", self)
     @invoice_item_repository = InvoiceItemRepo.new("#{dir}/invoice_items.csv", self)
     @invoice_repository = InvoiceRepo.new("#{dir}/invoices.csv", self)
     @item_repository = ItemRepo.new("#{dir}/items.csv", self)
     @merchant_repository = MerchantRepo.new("#{dir}/merchants.csv", self)
     @transaction_repository = TransactionRepo.new("#{dir}/transactions.csv", self)
   end

   def startup

   end

 end

 # engine = SalesEngine.new("./data")
 # engine.startup
