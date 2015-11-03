class Invoice < ActiveRecord::Base

  belongs_to :merchant

  def self.random
    order("RANDOM()").first
  end

end
