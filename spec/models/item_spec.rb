require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) { Item.create!(name: "New Item Name") }
 
   describe "attributes" do
     it "responds to name" do
       expect(item).to respond_to(:name)
     end
   end
end
