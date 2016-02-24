class Customer < ActiveRecord::Base

  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices
end