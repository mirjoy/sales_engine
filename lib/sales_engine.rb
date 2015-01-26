 require_relative '../lib/customer_repo'
 require_relative '../lib/invoice_item_repo'
 require_relative '../lib/invoice_repo'
 require_relative '../lib/item_repo'
 require_relative '../lib/merchant_repo'
 require_relative '../lib/transaction_repo'

 class SalesEngine
   attr_accessor :customer_repo,
                 :invoice_item_repo,
                 :invoice_repo,
                 :transaction_repo,
                 :merchant_repo,
                 :item_repo

   def initialize(dir)
     @customer_repo = CustomerRepo.new("#{dir}/customers.csv", self)
     @invoice_item_repo = InvoiceItemRepo.new("#{dir}/invoice_items.csv", self)
     @invoice_repo = InvoiceRepo.new("#{dir}/invoices.csv", self)
     @item_repo = ItemRepo.new("#{dir}/items.csv", self)
     @merchant_repo = MerchantRepo.new("#{dir}/merchants.csv", self)
     @transaction_repo = TransactionRepo.new("#{dir}/transactions.csv", self)
   end

 end

 # engine = SalesEngine.new
 # engine.startup
