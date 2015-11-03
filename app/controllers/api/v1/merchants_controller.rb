class Api::V1::MerchantsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find_by(id: params[:id])
  end

  def random
    respond_with Merchant.random
  end

  def find
    respond_with Merchant.find_by(merchant_params)
  end

  def find_all
   respond_with Merchant.where(merchant_params)
  end

  def items
    respond_with Item.joins(:merchant).where(merchant_id: params[:id])
  end

  def invoices
    respond_with Invoice.joins(:merchant).where(merchant_id: params[:id])
  end

  private

  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
