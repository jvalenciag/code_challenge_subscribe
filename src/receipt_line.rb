class ReceiptLine
  attr_accessor :quantity, :item
  def initialize(item, quantity)
    @item = item
    @quantity = quantity
  end

  def tax_amount
    @tax_amount ||= compute_tax
  end

  BASE_TAX_RATE = 0.1
  IMPORTED_TAX_RATE = 0.05

  def compute_tax
    amount = 0
    unless item.exempted?
      amount += round(@item.price_cents * BASE_TAX_RATE).to_i
    end
    if item.imported?
      amount += round(@item.price_cents * IMPORTED_TAX_RATE).to_i
    end
    amount * @quantity
  end
  
  def taxed_price
    (tax_amount + quantity * @item.price_cents)
  end

  private

  def round(x)
    (x * 0.2).ceil.to_f / 0.2
  end
end