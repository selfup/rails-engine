class ItemTest < ActiveSupport::TestCase

   test "is valid" do
     item = Item.first

     assert item.valid?
   end
end
