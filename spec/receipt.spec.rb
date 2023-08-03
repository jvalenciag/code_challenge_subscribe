$LOAD_PATH << File.dirname(__FILE__) + '/../src'
require "rspec"
require "item"
require "receipt_line"
require "receipt"

RSpec.describe "Receipt" do
  describe "#print" do
    subject do 
       -> { Receipt.new( [ ReceiptLine.new(Item.new("imported book", 1125), 3) ] ).print } 
    end
    it "prints receipt correctly" do 
      receipt_output = <<~TEXT
        1 imported product: 32.19
        1 some product: 20.89
        1 interesting book: 9.75
        3 imported book: 35.55
        Sales Taxes: 7.90
        Total: 98.38
      TEXT
      expect do
        Receipt.new( [ ReceiptLine.new(Item.new("imported product", 2799), 1),
          ReceiptLine.new(Item.new("some product", 1899), 1),
          ReceiptLine.new(Item.new("interesting book", 975), 1),
          ReceiptLine.new(Item.new("imported book", 1125), 3)] ).print
      end.to output(receipt_output).to_stdout
    end
  end
end