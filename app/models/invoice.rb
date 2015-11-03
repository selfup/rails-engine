class Invoice < ActiveRecord::Base

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :transactions

  def self.random
    order("RANDOM()").first
  end

end
