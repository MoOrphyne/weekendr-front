require 'open-uri'
require 'nokogiri'


puts "destroying all destinations"
Destination.destroy_all

puts "creating destinations"
Destination.create(destination_name: "Madrid", photo_link: "https://images.kiwi.com/photos/600x600/madrid_es.jpg")
puts "destination 1 done"
Destination.create(destination_name: "Barcelona", photo_link: "https://images.kiwi.com/photos/600x600/barcelona_es.jpg")
puts "destination 2 done"
Destination.create(destination_name: "Porto", photo_link: "https://images.kiwi.com/photos/600x600/porto_pt.jpg")
puts "destination 3 done"
Destination.create(destination_name: "Venice", photo_link: "https://images.kiwi.com/photos/600x600/venice_it.jpg")
puts "destination 4 done"
Destination.create(destination_name: "Berlin", photo_link: "https://images.kiwi.com/photos/600x600/berlin_de.jpg")
puts "destination 5 done"
Destination.create(destination_name: "Milan", photo_link: "https://images.kiwi.com/photos/600x600/milan_it.jpg")
puts "destination 6 done"
Destination.create(destination_name: "Amsterdam", photo_link: "https://images.kiwi.com/photos/600x600/amsterdam_nl.jpg")
puts "destination 7 done"
Destination.create(destination_name: "Dublin", photo_link: "https://images.kiwi.com/photos/600x600/dublin_ie.jpg")
puts "destination 8 done"


Destination.pluck(:destination_name).each do |city|
  puts "======= Scrapping #{city} ========="
  url = "https://www.numbeo.com/cost-of-living/in/#{city}"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.data_wide_table').each do |item|
    destination = Destination.find_by(destination_name: city)
    destination.update(
      banana_price: item.text.match(/Banana.+€/)[0],
      water_price: item.text.match(/Water.\W1.5.+€/)[0],
      transport_price: item.text.match(/One-way Ticket.+€/)[0]
    )
  end
end
# cities = %w(Madrid Barcelona Porto Venice Berlin Milan Amsterdam Dublin)
# cities.each do |city|
#   puts "==========================="
#   puts "Creating destinations #{city}"
#   puts "Scrapping data for #{city}"
#   url = "https://www.numbeo.com/cost-of-living/in/#{city}?displayCurrency=EUR"
#   html_file = open(url).read
#   html_doc = Nokogiri::HTML(html_file)
#   entries = url.css('.data_wide_table')
#   transport_price = entries.css('table')[0].css('tr')[30].css('.priceValue').text
#   banana_price = entries.css('table')[0].css('tr')[18].css('.priceValue').text
#   water_price = entries.css('table')[0].css('tr')[8].css('.priceValue').text
#   row_data = html_doc.search('.wide_data_table tr')
#   row_data.children.each do |data|
#     result = data.text.match(regex) ? data.text.match(regex)[0] : data.text.match(/\d+th/)[0]
#     # CONVERT DATA TO FLOAT ######################
#     # converted_result = result.split(',').join.to_f
#     ##############################################
#     p result
#   end
# end
