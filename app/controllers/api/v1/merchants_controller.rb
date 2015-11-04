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

  def invoices
    respond_with Merchant.find(params[:id]).invoices
  end

  def items
    respond_with Merchant.find(params[:id]).items
  end

  def revenue
    revenue = {
                :revenue => Merchant.find(params[:id]).
                revenue_by_param(params).to_s
               }
    respond_with revenue
  end

  def total_revenue
    total_rev = { :total_revenue => Merchant.total_revenue(params).to_s }
    respond_with total_rev
  end

  def items
    respond_with Merchant.find(params[:id]).items
  end

  def favorite_customer
    respond_with Merchant.find(params[:id]).favorite_customer
  end

  def customers_with_pending_invoices
    respond_with Merchant.find(params[:id]).customers_pending_invoices
  end

  private

  def merchant_params
    params.permit(
      :id,
      :name,
      :created_at,
      :updated_at,
      :quantity
    )
  end
end
