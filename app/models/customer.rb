class Customer < ActiveRecord::Base

  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  def favorite_merchant(params)
    invoices = Customer.find(params[:customer_id]).transactions.where(result: "success").pluck(:invoice_id)
    merchants = Invoice.find(invoices).map { |invoice| invoice.merchant_id }
    get_mode(merchants)
  end

  def get_mode(merchants)
    count = Hash.new(0)
    merchants.each {|x| count[x] += 1 }
    id = count.sort_by{|k,v| v}.last[0]
    name = Merchant.find_by(id: id)
  end

end
