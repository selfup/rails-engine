class Api::V1::InvoicesController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Invoice.all
  end

  def show
    respond_with Invoice.find_by(id: params[:id])
  end

  def random
    respond_with Invoice.random
  end

  def find
    respond_with Invoice.find_by(invoice_params)
  end

  def find_all
   respond_with Invoice.where(invoice_params)
  end

  def transactions
    respond_with Transaction.joins(:invoice).where(invoice_id: params[:id])
  end

  def invoice_items
    respond_with InvoiceItem.joins(:invoice).where(invoice_id: params[:id])
  end

  def items
    respond_with InvoiceItem.joins(:invoice).where(item_id: params[:id])
  end

  def customer
    respond_with Invoice.joins(:customer).where(customer_id: params[:id])
  end

  private

  def invoice_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
