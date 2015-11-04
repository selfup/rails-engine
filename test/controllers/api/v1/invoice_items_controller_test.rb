require 'test_helper'

class Api::V1::InvoiceItemsControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json

    assert_response :success
  end

  test '#index returns the right number of InvoiceItems' do
    number_of_invoiceitems = InvoiceItem.count

    get :index, format: :json

    json_response = JSON.parse(response.body)

    assert_equal number_of_invoiceitems, json_response.count
  end

  test '#show' do
    get :show, format: :json, id: 1

    assert_response :success
  end

  test '#show returns the right InvoiceItem attributes' do
    get :show, format: :json, id: 1

    item = InvoiceItem.find(1)

    json_response = JSON.parse(response.body)

    assert_equal item.id, json_response["id"]
    assert_equal item.item_id, json_response["item_id"]
    assert_equal item.invoice_id, json_response["invoice_id"]
    assert_equal item.quantity, json_response["quantity"]
    assert_equal "0.01", json_response["unit_price"]
  end

  test '#random' do
    get :random, format: :json

    assert_response :success
  end

  test '#find' do
    get :find, format: :json, item_id: 1

    assert_response :success
  end

  test '#find_all' do
    get :find_all, format: :json, item_id: 1

    assert_response :success
  end

  test '#invoice' do
    get :invoice, format: :json, id: 1

    assert_response :success
  end

  test '#item' do
    get :item, format: :json, id: 1

    assert_response :success
  end
end
