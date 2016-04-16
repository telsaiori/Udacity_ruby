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
  
products_hash["items"].each do |toy|
    puts "********************"
    puts toy["title"]
    puts "Retail Price: $#{toy["full-price"]}"
    puts "Total Purchase: #{toy["purchases"].size}"
    total_sales = toy["purchases"].inject(0){|sum,data| sum + data["price"]}
    puts "Total Sales: $#{total_sales}"
    puts "Average Price: $#{(total_sales/toy["purchases"].size).round(2)}"
    puts "Average Discount: $#{toy["full-price"].to_f-(total_sales/toy["purchases"].size).round(2)}"
    puts "Average Discount Percentage: #{(((toy["full-price"].to_f-(total_sales/toy["purchases"].size))/toy["full-price"].to_f) * 100).round(2)}%"
    puts " "
    $report_file.puts " "
end
puts "********************"
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
 by_brand =[]

 name = products_hash["items"].map{|item| item["brand"]}.uniq
 name.each do |n|
      total_stock = 0
      total_price = 0
      total_sales = 0
     puts n
     puts "********************"
    by_brand = products_hash["items"].select do |brand|
        brand["brand"] == n
    end
    by_brand.each do |item|
        total_stock += item["stock"].to_i
        total_price += item["full-price"].to_i
        item["purchases"].each do |pur|
            total_sales += pur["price"].to_f
        end
    end
    # Count and print the number of the brand's toys we stock
    puts "Number of products: #{total_stock}"
    # Calculate and print the average price of the brand's toys
    puts "Average product price: $#{(total_price/by_brand.size).round(2)}"
    # Calculate and print the total revenue of all the brand's toy sales combined
    puts "Total Sales: $#{(total_sales).round(2)}"

  
end

    

