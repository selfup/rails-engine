class Merchant < ActiveRecord::Base
  default_scope { order(:id) }
  has_many :items
  has_many :invoices

  def self.random
    order("RANDOM()").first
  end

  def favorite_customer
    cust_id = invoices.successful.group(:customer_id).order("count_id desc").count("id").first[0]
    Customer.find(cust_id)
  end

  def revenue_by_param(params)
    if params[:date]
      date_for_revenue(params[:date])
    else
      revenue
    end
  end

  def date_for_revenue(date)
    invoices.successful.by_date(params[:date]).
    joins(:invoice_items).sum("quantity * unit_price")
  end

  def revenue
    invoices.successful.joins(:invoice_items).sum("quantity * unit_price")
  end

  def self.total_revenue(params)
    Invoice.successful.by_date(params[:date]).
    joins(:invoice_items).sum("quantity * unit_price")
  end

  def items_sold
    invoices.successful.joins(:invoice_items).sum("quantity")
  end

end
