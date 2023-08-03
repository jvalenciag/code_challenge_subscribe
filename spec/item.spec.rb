$LOAD_PATH << File.dirname(__FILE__) + '/../src'
require "rspec"
require "item"


RSpec.describe "Item" do
  context "#imported?" do
    it "is imported" do
      item = Item.new("imported some product", 2323)
      expect(item.imported?).to be true
    end

    it "is not imported" do
      item = Item.new("not imported product", 2323)
      expect(item.imported?).to be false
    end
  end
  
  context "#exempted?" do
    it "is exempted?" do
      item = Item.new("some  pills", 12)
      expect(item.exempted?).to be true
    end

    it "is not exempted?" do
      item = Item.new("some  perfume", 12)
      expect(item.exempted?).to be false
    end
  end
end