require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)
# Print today's date
puts "Today's Date:#{Time.now.strftime(" %m/%d/%Y")}"
    
puts "                     _            _       "
puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "


# For each product in the data set:
  # Print the name of the toy
  # Print the retail price of the toy
  # Calculate and print the total number of purchases
  # Calculate and print the total amount of sales
  # Calculate and print the average price the toy sold for
  # Calculate and print the average discount (% or $) based off the average sales price
  
total_sale = 0
ave = 0 # count the Average Discount
products_hash.each do |product|
   product[1].each do |data|
       puts " "
       puts data["title"]
       puts "********************"
       puts "Retail Price: $#{data["full-price"]}"
       puts "Total Purchases: #{data["purchases"].size}"
       data["purchases"].each do |purchase|
               total_sale += purchase["price"]
       end
       puts "Total Sales: $#{total_sale}"
       puts "Average Price: $#{total_sale/data["purchases"].size}"
       ave = (data["full-price"].to_f * data["purchases"].size - total_sale) / data["purchases"].size
       puts "Average Discount: $#{ave.round(1)}"
       ave = ave / data["full-price"].to_f * 100.round(2)
       puts "Average Discount Percentage: #{ave.round(2)}%"
       total_sale = 0
       ave = 0
       puts "********************"
   end
end


	puts " _                         _     "
	puts "| |                       | |    "
	puts "| |__  _ __ __ _ _ __   __| |___ "
	puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
	puts "| |_) | | | (_| | | | | (_| \\__ \\"
	puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
	puts

# For each brand in the data set:
  # Print the name of the brand
  # Count and print the number of the brand's toys we stock
  # Calculate and print the average price of the brand's toys
  # Calculate and print the total revenue of all the brand's toy sales combined
brands = []
products_amount = 0
ave_price = 0
total_price = 0
products_hash["items"].each do |brand|  #save all brands to array
   unless brands.include?(brand["brand"])
        brands.include?(brand["brand"])
        brands.push brand["brand"]
   end
end

brands.each do |brand| #save each brand to the array
    puts ""
    puts brand
    puts "********************"
    products = products_hash["items"].select do |product| #save same brand's data to "products"
         product["brand"] == brand
    end
    
    products.each do |stock|  #Number of Products
        products_amount += stock["stock"]
        products_amount
    end
    puts "Number of Products: #{products_amount}" 
    products_amount = 0 
    
    products.each do |price| # count Average Product Price
        ave_price += price["full-price"].to_f
        ave_price / products.size
    end
    ave_price = ave_price / products.size
    puts "Average Product Price: $#{ave_price.round(2)}"
    ave_price = 0
    
    products.each do |total| #count total sales
        total["purchases"].each do |price|
            total_price += price["price"]
        end
    end
    puts "Total Sales: $#{total_price.round(2)}"
     total_price = 0
end
    
    
    
