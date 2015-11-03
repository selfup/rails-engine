class InvoiceItem < ActiveRecord::Base

  def self.random
    order("RANDOM()").first
  end

end
