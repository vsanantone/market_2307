require './lib/vendor'
require './lib/item'


RSpec.describe Vendor do
  before(:each) do
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end

  describe "#initialize" do
    it "exist" do
      expect(@vendor).to be_a Vendor
    end
  end

  describe "#attributes" do
    it "has readable attributes" do
      
      expect(@vendor.name).to eq "Rocky Mountain Fresh"
    end
  end
  
  describe "#inventory" do
    it "stores vendor inventory" do
      expect(@vendor.inventory).to eq({})
    end
  end
  
  describe "#check_stock(item)" do
    it "checks available stock and quantity" do
      expect(@vendor.check_stock(@item1)).to eq(0)

    end
  end

  describe "#stock" do
    it "stocks items" do
      expect(@vendor.check_stock(@item1)).to eq(0)

      @vendor.stock(item1, 30)
      expect(@vendor.inventory).to eq({name: 'Peach', price: "$0.75", quantity: 30})
      
      @vendor.stock(item1, 25)

      expect(@vendor.check_stock(item1)).to eq(55)
    
      
      @vendor.stock(item2, 12)
      
      expect(@vendor.inventory).to eq({name: 'Peach', price: "$0.75", quantity: 55},
      {name: 'Tomato', price: '$0.50', quantity: 12})
    end
  end
end