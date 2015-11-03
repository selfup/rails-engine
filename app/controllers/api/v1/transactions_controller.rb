class Api::V1::TransactionsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Transaction.all
  end

  def show
    respond_with Transaction.find_by(id: params[:id])
  end

  def random
    respond_with Transaction.random
  end

  def find
    respond_with Transaction.find_by(transaction_params)
  end

  def find_all
   respond_with Transaction.where(transaction_params)
  end

  def invoice
    respond_with Transaction.find(params[:id]).invoice
  end

  private

  def transaction_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
