class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at

  def unit_price
    (object.unit_price / 100.00).to_s
  end
end
