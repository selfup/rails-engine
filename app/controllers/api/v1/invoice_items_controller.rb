class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with InvoiceItem.all
  end

  def show
    respond_with InvoiceItem.find_by(id: params[:id])
  end

  def random
    respond_with InvoiceItem.random
  end

  def find
    if invoice_item_params[:unit_price]
      respond_with InvoiceItem.find_by(invoice_item_params.
                                      map { |k,v| [k, v.gsub(".", "")]}.to_h)
    else
      respond_with InvoiceItem.find_by(invoice_item_params)
    end
  end

  def find_all
    if invoice_item_params[:unit_price]
      respond_with InvoiceItem.where(invoice_item_params.
                                      map { |k,v| [k, v.gsub(".", "")]}.to_h)
    else
      respond_with InvoiceItem.where(invoice_item_params)
    end
  end

  def invoice
    respond_with InvoiceItem.find(params[:id]).invoice
  end

  def item
    respond_with InvoiceItem.find(params[:id]).item
  end

  private

  def invoice_item_params
    params.permit(
      :id,
      :item_id,
      :invoice_id,
      :quantity,
      :unit_price,
      :invoice_item_id,
      :created_at,
      :updated_at
      )
  end
end
