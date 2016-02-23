require 'csv'

namespace :data do
  desc "Import data from CSV's"
  task import_data: :environment do

    CSV.foreach("data/customers.csv", :headers => true) do |row|

    end

    CSV.foreach("data/invoice_items.csv", :headers => true) do |row|

    end

    CSV.foreach("data/invoice.csv", :headers => true) do |row|

    end

    CSV.foreach("data/items.csv", :headers => true) do |row|

    end

    CSV.foreach("data/merchants.csv", :headers => true) do |row|

    end

    CSV.foreach("data/transactions.csv", :headers => true) do |row|

    end

  end
end
