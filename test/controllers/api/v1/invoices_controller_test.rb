require 'test_helper'

class Api::V1::InvoicesControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json

    assert_response :success
  end

  test '#index returns the right number of Invoices' do
    number_of_invoices = Invoice.count

    get :index, format: :json

    json_response = JSON.parse(response.body)

    assert_equal number_of_invoices, json_response.count
  end

  test '#show' do
    get :show, format: :json, id: 1

    assert_response :success
  end

  test '#show returns the right InvoiceItem attributes' do
    get :show, format: :json, id: 1

    item = Invoice.find(1)

    json_response = JSON.parse(response.body)

    assert_equal item.id, json_response["id"]
    assert_equal item.customer_id, json_response["customer_id"]
    assert_equal item.merchant_id, json_response["merchant_id"]
    assert_equal item.status, json_response["status"]
  end

  test '#random' do
    get :random, format: :json

    assert_response :success
  end

  test '#find' do
    get :find, format: :json, customer_id: 1

    assert_response :success
  end

  test '#find_all' do
    get :find_all, format: :json, customer_id: 2

    assert_response :success
  end

  test '#transactions' do
    get :transactions, format: :json, id: 2

    assert_response :success
  end

  test '#items' do
    get :items, format: :json, id: 2

    assert_response :success
  end

  test '#invoice_items' do
    get :invoice_items, format: :json, id: 2

    assert_response :success
  end

  test '#customer' do
    get :customer, format: :json, id: 2

    assert_response :success
  end

  test '#merchant' do
    get :merchant, format: :json, id: 2

    assert_response :success
  end
end
