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
                 :transaction_repo
                 :merchant_repo
                 :item_repo

   def initialize
     @customer_repo = CustomerRepo.new('../data/customers', self)
     @invoice_item_repo = InvoiceItemRepo.new('../data/invoice_items', self)
     @invoice_repo = InvoiceRepo.new('../data/invoices', self)
    #  @item_repo = ItemRepo.new('../data/items', self)
    #  @merchant_repo = MerchantRepo.new('../data/merchants', self)
     @transaction_repo = TransactionRepo.new('../data/transactions', self)
   end

   def merchant_repo(filename = '../data/merchants.csv')
     @merchant_repo ||= MerchantRepo.new(filename, self)
   end

   def item_repo(filename = '../data/items')
     @item_repo ||= ItemRepo.new(filename, self)
   end

 end

 # engine = SalesEngine.new
 # engine.startup
