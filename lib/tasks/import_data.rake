require 'csv'

namespace :import_data do
  desc "Import data from CSV's"
  task :import => :environment do

    CSV.foreach("data/merchants.csv", :headers => true) do |row|
      Merchant.create(row.to_h)
    end

    CSV.foreach("data/customers.csv", :headers => true) do |row|
      Customer.create(row.to_h)
    end

    CSV.foreach("data/items.csv", :headers => true) do |row|
      Item.create(row.to_h)
    end

    CSV.foreach("data/invoices.csv", :headers => true) do |row|
      Invoice.create(row.to_h)
    end

    CSV.foreach("data/transactions.csv", :headers => true) do |row|
      Transaction.create([
        :credit_card_number => row['credit_card_number'],
        :result     => row['result'],
        :invoice_id => row['invoice_id'],
        :created_at => row['created_at'],
        :updated_at => row['updated_at']
      ])
    end

    CSV.foreach("data/invoice_items.csv", :headers => true) do |row|
      InvoiceItem.create(row.to_h)
    end

  end
end
