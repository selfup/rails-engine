require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  test "is valid" do
    customer = Customer.first

    assert customer.valid?
  end
end
