require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
  test "is valid" do
    merchant = Merchant.first

    assert merchant.valid?
  end
end
