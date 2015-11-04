class Merchant < ActiveRecord::Base
  # default_scope { order(:iid) }
  has_many :items
  has_many :invoices

  def self.random
    order("RANDOM()").first
  end

  def revenue
    invoices.successful.joins(:invoice_items).sum("quantity * unit_price")
  end

  def items_sold
    invoices.successful.joins(:invoice_items).sum("quantity")
  end

end
