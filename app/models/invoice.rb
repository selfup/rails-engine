class Invoice < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :customer
  has_many :invoice_items
  has_many :transactions
  has_many :items, through: :invoice_items

  def self.by_date(date)
    where(created_at: date)
  end

  def self.random
    order("RANDOM()").first
  end

  def self.successful
    joins(:transactions).where("result = 'success'")
  end

end
