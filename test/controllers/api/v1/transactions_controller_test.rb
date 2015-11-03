require 'test_helper'

class Api::V1::TransactionsControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json

    assert_response :success
  end

  test '#index returns the right number of transactions' do
    number_of_Transactions = Transaction.count

    get :index, format: :json

    json_response = JSON.parse(response.body)

    assert_equal number_of_transactions, json_response.count
  end

  test '#show' do
    get :show, format: :json, id: 1

    assert_response :success
  end

  test '#show returns the right transaction attributes' do
    get :show, format: :json, id: 1

    item = Transaction.find(1)

    json_response = JSON.parse(response.body)

    assert_equal item.id, json_response["id"]
    assert_equal item.invoice_id, json_response["invoice_id"]
    assert_equal item.credit_card_number, json_response["credit_card_number"]
    assert_equal item.credit_card_expiration_date, json_response["credit_card_expiration_date"]
    assert_equal item.result, json_response["result"]    
  end
end
