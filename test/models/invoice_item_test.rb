require 'test_helper'

class InvoiceItemTest < ActiveSupport::TestCase
  test "is valid" do
    invoice_item = InvoiceItem.first

    assert invoice_item.valid?
  end
end
