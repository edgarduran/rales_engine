class Merchant < ActiveRecord::Base

  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  def self.most_revenue(params)

  end

  def total_revenue(params)
    invoices = Merchant.find(params[:merchant_id]).invoices.pluck(:id)
    paid = Transaction.where(invoice_id: invoices).where(result: "success").pluck(:invoice_id)
    sum_invoices(paid)
  end

  def revenue_by_date(params)
    invoices = Merchant.find(params[:merchant_id]).invoices.where(created_at: params["date"])
    paid = Transaction.where(invoice_id: invoices.pluck(:id)).where(result: "success").pluck(:invoice_id)
    sum_invoices(paid)
  end

  def self.total_revenue_by_date(date)
    joins(invoices: [:transactions, :invoice_items]).where("transactions.result = ?", "success").where("invoices.created_at = ?", date).sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def self.most_items(quantity)
    paid = Transaction.where(invoice_id: Invoice.all.pluck(:id)).where(result: "success").pluck(:invoice_id)
    InvoiceItem.where(invoice_id: paid).sum("quantity").to_s
  end

  def favorite_customer(params)
    invoices = Merchant.find(params[:merchant_id]).transactions.where(result: "success").pluck(:invoice_id)
    customers = Invoice.find(invoices).map { |invoice| invoice.customer_id }
    get_mode(customers)
  end

  def pending_invoices(params)
    invoices = Merchant.find(params[:merchant_id]).transactions.where(result: "failed").pluck(:invoice_id)
    customers = Invoice.find(invoices).map { |invoice| invoice.customer }
  end

  def sum_invoices(paid)
    InvoiceItem.where(invoice_id: paid).sum("unit_price * quantity").to_s
  end

  def get_mode(customers)
    count = Hash.new(0)
    customers.each {|x| count[x] += 1 }
    id = count.sort_by{|k,v| v}.last[0]
    name = Customer.find_by(id: id)
  end
end
