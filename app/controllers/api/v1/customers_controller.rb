class Api::V1::CustomersController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Customer.all
  end

  def show
    respond_with Customer.find_by(id: params[:id])
  end

  def random
    respond_with Customer.random
  end

  def find
    respond_with Customer.find_by(customer_params)
  end

  def find_all
   respond_with Customer.where(customer_params)
  end

  def invoices
    respond_with Customer.find(params[:id]).invoices
  end

  def transactions
    respond_with Customer.find(params[:id]).transactions
  end

  def favorite_merchant
    respond_with Customer.find_by(customer_params).favorite_merchant
  end

  private

  def customer_params
    params.permit(
      :id,
      :first_name,
      :last_name,
      :customer_id,
      :created_at,
      :updated_at
      )
  end
end
