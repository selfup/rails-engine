class Customer < ActiveRecord::Base

  has_many :invoices
  has_many :transactions, through: :invoices

  def self.random
    order("RANDOM()").first
  end

  def favorite_merchant
    binding.pry
    fav_id = invoices.successful.group(:merchant_id).count.first[0]
    Merchant.find_by(id: fav_id)

    # Merchant.select("invoices.*, count(order_items.customer_id) AS items_count").
    #                       joins(:order_items).
    #                       group("items.id").
    #                       order("items_count DESC").
    #                       take(2)
  end

end
