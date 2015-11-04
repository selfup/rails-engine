class Item < ActiveRecord::Base

  belongs_to :merchant
  has_many :invoice_items

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

end
