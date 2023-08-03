$LOAD_PATH << File.dirname(__FILE__) + '/src'

require "basket_parser"

BasketParser.new("data/product_list_1").build_receipt().print
puts
BasketParser.new("data/product_list_2").build_receipt().print
puts
BasketParser.new("data/product_list_3").build_receipt().print