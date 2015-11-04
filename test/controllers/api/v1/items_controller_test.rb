require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json

    assert_response :success
  end

  test '#index returns the right number of items' do
    number_of_items = Item.count

    get :index, format: :json

    json_response = JSON.parse(response.body)

    assert_equal number_of_items, json_response.count
  end

  test '#show' do
    get :show, format: :json, id: 1

    assert_response :success
  end

  test '#show returns the right item attributes' do
    get :show, format: :json, id: 1

    item = Item.find(1)

    json_response = JSON.parse(response.body)

    assert_equal item.id, json_response["id"]
    assert_equal item.name, json_response["name"]
    assert_equal item.description, json_response["description"]
  end

  test '#random' do
    get :random, format: :json

    assert_response :success
  end

  test '#find' do
    get :find, format: :json, name: "Lamp"

    assert_response :success
  end

  test '#find by unit_price' do
    get :find, format: :json, unit_price: "10.0"

    assert_response :success
  end

  test '#find_all' do
    get :find_all, format: :json, name: "Phone"

    assert_response :success
  end

  test '#find_all by unit_price' do
    get :find_all, format: :json, unit_price: "10.0"

    assert_response :success
  end

  test '#invoice_items' do
    get :invoice_items, format: :json, id: 1

    assert_response :success
  end

  test '#merchant' do
    get :merchant, format: :json, id: 1

    assert_response :success
  end

  test '#most_items' do
    get :most_items, format: :json, id: 1

    assert_response :success
  end
end
