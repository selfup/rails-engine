class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices

  def self.random
    order("RANDOM()").first
  end

  def favorite_merchant
    fav_id = invoices.successful.group(:merchant_id).count.sort_by { |key, value| value }.reverse.first[0]
    Merchant.find_by(id: fav_id)
  end

end
