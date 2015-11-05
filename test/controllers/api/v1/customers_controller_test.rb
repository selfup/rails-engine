require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json

    assert_response :success
  end

  test '#index returns the right number of customers' do
    number_of_customers = Customer.count

    get :index, format: :json

    json_response = JSON.parse(response.body)

    assert_equal number_of_customers, json_response.count
  end

  test '#show' do
    get :show, format: :json, id: 1

    assert_response :success
  end

  test '#show returns the right customer attributes' do
    get :show, format: :json, id: 1

    item = Customer.find(1)

    json_response = JSON.parse(response.body)

    assert_equal item.id, json_response["id"]
    assert_equal item.first_name, json_response["first_name"]
    assert_equal item.last_name, json_response["last_name"]
  end

  test '#random' do
    get :random, format: :json

    assert_response :success
  end

  test '#find' do
    get :find, format: :json, first_name: "Regis"

    assert_response :success
  end

  test '#find_all' do
    get :find_all, format: :json, first_name: "Jeff"

    assert_response :success
  end

  test '#invoices' do
    get :invoices, format: :json, id: 1

    assert_response :success
  end

  test '#transactions' do
    get :transactions, format: :json, id: 1

    assert_response :success
  end
end
