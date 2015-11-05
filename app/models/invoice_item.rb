class InvoiceItem < ActiveRecord::Base
  default_scope { order(:id) }
  belongs_to :invoice
  belongs_to :item

  before_save :unit_price_to_dollars

  def unit_price_to_dollars
    self.unit_price = self.unit_price/100.00
  end

  def self.random
    order("RANDOM()").first
  end

  def self.successful
    joins(:invoice).merge(Invoice.successful)
  end

end
