class Api::V1::ItemsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find_by(id: params[:id])
  end

  def random
    respond_with Item.random
  end

  def find
    respond_with Item.find_by(item_params)
  end

  def find_all
   respond_with Item.where(item_params)
  end

  def invoice_items
    respond_with Item.find_by(item_params).invoice_items
  end

  def merchant
    respond_with Item.find_by(item_params).merchant
  end

  def most_items
    respond_with Item.most_items(params[:quantity].to_i)
  end

  def best_day
    best_day = { :best_day => Item.find(params[:id]).best_day }
    respond_with best_day
  end

  def most_revenue
    respond_with Item.most_revenue(params)
  end

  private

  def item_params
    params.permit(
      :id,
      :name,
      :description,
      :unit_price,
      :merchant_id,
      :item_id,
      :created_at,
      :updated_at,
      :quantity
    )
end
end
