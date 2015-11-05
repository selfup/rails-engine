require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  test "is valid" do
    invoice = Invoice.first

    assert invoice.valid?
  end
end
