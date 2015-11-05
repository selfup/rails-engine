class Item < ActiveRecord::Base
  default_scope { order(:id) }
  belongs_to :merchant
  has_many :invoice_items

  before_save :unit_price_to_dollars

  def unit_price_to_dollars
    self.unit_price = self.unit_price/100.00
  end

  def self.random
    order("RANDOM()").first
  end

  def self.most_items(quantity)
    amount_sold[0..(quantity - 1)].map { |id| Item.find_by(id: id) }
  end

  def self.amount_sold
    Invoice.successful.joins(:items).group(:item_id).count.
    sort_by { |key, value| value }.reverse
  end

  def best_day
    invoice_items.successful
  end

  def self.most_revenue(params)
    InvoiceItem.first
  end

end
