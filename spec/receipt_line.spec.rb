$LOAD_PATH << File.dirname(__FILE__) + '/../src'
require "rspec"
require "item"
require "receipt_line"

RSpec.describe "ReceiptLine" do
  describe "#tax_amount" do
    subject { ReceiptLine.new(Item.new(product_desc, 1125), 3).tax_amount }
    context "for imported not exempted item" do
      let(:product_desc) { 'imported product' }
      it { is_expected.to eq(525) }
    end
    context "for imported exempted item" do
      let(:product_desc) { 'imported pills' }
      it { is_expected.to eq(180) }
    end
    context "for not imported not exempted item" do
      let(:product_desc) { 'some product' }
      it { is_expected.to eq(345) }
    end
    context "for not imported exempted item" do
      let(:product_desc) { 'some pills' }
      it { is_expected.to eq(0) }
    end
  end

  describe "#taxed_price" do
    subject { ReceiptLine.new(Item.new(product_desc, 1125), 3).taxed_price }
    context "for imported not exempted item" do
      let(:product_desc) { 'imported product' }
      it { is_expected.to eq(525 + 1125 * 3) }
    end
    context "for imported exempted item" do
      let(:product_desc) { 'imported pills' }
      it { is_expected.to eq(180 + 1125 * 3) }
    end
    context "for not imported not exempted item" do
      let(:product_desc) { 'some product' }
      it { is_expected.to eq(345 + 1125 * 3) }
    end
    context "for not imported exempted item" do
      let(:product_desc) { 'some pills' }
      it { is_expected.to eq(0 + 1125 * 3) }
    end
  end
end