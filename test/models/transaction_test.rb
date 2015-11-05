require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  test "is valid" do
    transaction = Transaction.first

    assert transaction.valid?
  end
end
