class Item < ActiveRecord::Base
  belongs_to :merchant


  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  before_save :format_currency

  private

  def format_currency
    self.unit_price = unit_price/100.00
  end
end
