EXEMPTED_ITEMS = /chocolate|pills|book/

class Item
   attr_accessor :description, :price_cents
  def initialize(description, price)
    @description = description
    @price_cents = price
  end

  def imported?
    description.start_with?("imported ")
  end

  def exempted?
    search_exceptions(description)
  end

  private
  
  def search_exceptions(description)
    return !!(description =~ EXEMPTED_ITEMS)
  end

end