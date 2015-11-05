require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json

    assert_response :success
  end

  test '#index returns the right number of merchants' do
    number_of_merchants = Merchant.count

    get :index, format: :json

    json_response = JSON.parse(response.body)

    assert_equal number_of_merchants, json_response.count
  end

  test '#show' do
    get :show, format: :json, id: 1

    assert_response :success
  end

  test '#show returns the right merchant attributes' do
    get :show, format: :json, id: 1

    item = Merchant.find(1)

    json_response = JSON.parse(response.body)

    assert_equal item.id, json_response["id"]
    assert_equal item.name, json_response["name"]
  end

  test '#random' do
    get :random, format: :json

    assert_response :success
  end

  test '#find' do
    get :find, format: :json, name: "Henry"

    assert_response :success
  end

  test '#find_all' do
    get :find_all, format: :json, name: "Alice"

    assert_response :success
  end

  test '#invoices' do
    get :invoices, format: :json, id: 1

    assert_response :success
  end

  test '#items' do
    get :items, format: :json, id: 1

    assert_response :success
  end

  test '#revenue' do
    get :revenue, format: :json, id: 1

    assert_response :success
  end

  test '#total_revenue' do
    get :total_revenue, format: :json, id: 1

    assert_response :success
  end

  test '#customers_with_pending_invoices' do
    get :customers_with_pending_invoices, format: :json, id: 1

    assert_response :success
  end
end
