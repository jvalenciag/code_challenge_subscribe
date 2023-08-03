require_relative "item"
require_relative "receipt_line"
require_relative "receipt"

class BasketParser
  def initialize(filename)
    @filename = filename
  end
  
  LINE_REGEX = /^(\d+) (.*) at (\d+\.\d{2})$/

  def build_receipt
    lines = []
    IO.foreach(@filename) do |line|
      m = line.match(LINE_REGEX)
      raise "Line does not match format: #{line} " unless m
      item = Item.new(m[2], price_to_cents(m[3]))
      lines.push ReceiptLine.new(item, m[1].to_i)
    end
    Receipt.new(lines)
  end

  def price_to_cents(str)
   nums = str.split('.')
   nums[0].to_i*100 + nums[1].to_i
  end
end