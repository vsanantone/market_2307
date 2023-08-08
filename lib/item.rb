class Item
  attr_reader :name,
              :price

  def initialize(data)
    @name = data[:name]
    @price = convert_price_format(data[:price])
  end

  def convert_price_format(price_str)
    price_str.gsub!("$", '').to_f
  end
end




































# class Item
#   attr_reader :name,
#               :price

#   def initialize(data)
#     @name = data[:name]
#     @price = modified_price(data[:price]) 
#   end


#   def modified_price(str)
#     str.gsub('$', '').to_f
#   end
# end