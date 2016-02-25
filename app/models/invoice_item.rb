class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice

  before_save :format_currency

  private

  def format_currency
    self.unit_price = unit_price/100.00
  end

end
