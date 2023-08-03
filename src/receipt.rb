class Receipt
  def initialize(lines)
    @lines = lines
  end

  def sales_taxes
    @total_tax ||= @lines.inject(0){|sum, l| sum + l.tax_amount} / 100.0
  end

  def total
    @total ||= @lines.inject(0){|sum, l| sum + l.taxed_price}/ 100.0
  end

  def print
    @lines.each do |l|
      puts "#{l.quantity} #{l.item.description}: #{ sprintf('%.2f', l.taxed_price / 100.0) }"
    end
    puts "Sales Taxes: #{sprintf('%.2f', sales_taxes)}"
    puts "Total: #{sprintf('%.2f', total)}"
  end
end
