class Transaction < ActiveRecord::Base
  # default_scope { order(:id) }
  belongs_to :invoice

  def self.random
    order("RANDOM()").first
  end

end
