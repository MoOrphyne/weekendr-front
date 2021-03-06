require 'open-uri'
require 'nokogiri'


puts "destroying all destinations"
Destination.destroy_all

puts "creating destinations"
Destination.create(destination_name: "Madrid",
                  country_name: "Espagne",
                  country_flag: "spain.svg",
                  photo_link: "https://images.kiwi.com/photos/600x600/madrid_es.jpg")
puts "destination 1 done"
Destination.create(destination_name: "Barcelona",
                  country_name: "Espagne",
                  country_flag: "spain.svg",
                  photo_link: "https://images.kiwi.com/photos/600x600/barcelona_es.jpg")
puts "destination 2 done"
Destination.create(destination_name: "Porto",
                  country_name: "Portugal",
                  country_flag: "portugal.svg",
                  photo_link: "https://images.kiwi.com/photos/600x600/porto_pt.jpg")
puts "destination 3 done"
Destination.create(destination_name: "Venice",
                  country_name: "Italie",
                  country_flag: "italy.svg",
                  photo_link: "https://images.kiwi.com/photos/600x600/venice_it.jpg")
puts "destination 4 done"
Destination.create(destination_name: "Berlin",
                  country_name: "Allemagne",
                  country_flag: "germany.svg",
                  photo_link: "https://images.kiwi.com/photos/600x600/berlin_de.jpg")
puts "destination 5 done"
Destination.create(destination_name: "Milan",
                  country_name: "Italie",
                  country_flag: "italy.svg",
                  photo_link: "https://images.kiwi.com/photos/600x600/milan_it.jpg")
puts "destination 6 done"
Destination.create(destination_name: "Amsterdam",
                  country_name: "Pays-Bas",
                  country_flag: "netherlands.svg",
                  photo_link: "https://images.kiwi.com/photos/600x600/amsterdam_nl.jpg")
puts "destination 7 done"
Destination.create(destination_name: "Dublin",
                  country_name: "Irlande",
                  country_flag: "ireland.svg",
                  photo_link: "https://images.kiwi.com/photos/600x600/dublin_ie.jpg")
puts "destination 8 done"
Destination.create(destination_name: "Paris",
                  country_name: "France",
                  country_flag: "france.svg",
                  photo_link: "https://www.oceane-voyages.com/wp-content/uploads/2019/01/Paris-600x600.jpeg")
puts "destination 9 done"
Destination.create(destination_name: "Oslo",
                  country_name: "Norvège",
                  country_flag: "norway.svg",
                  photo_link: "https://www.shoreexcursionsgroup.com/img/tour/EUOSWALK-2.jpg")
puts "destination 10 done"
Destination.create(destination_name: "Freeport",
                  country_name: "Bahamas",
                  country_flag: "bahamas.svg",
                  photo_link: "https://bnt.bs/wp-content/uploads/2018/03/eclsp-image-1-600x600.jpg")
puts "destination 11 done"
Destination.create(destination_name: "Moscow",
                  country_name: "Russie",
                  country_flag: "russia.svg",
                  photo_link: "https://1vu2vab7ghf47835m3t9p5zz-wpengine.netdna-ssl.com/wp-content/uploads/2013/07/Moscow-river-cruise-Russia-tour-600x600.jpg")
puts "destination 12 done"
Destination.create(destination_name: "Luxor-Egypt",
                  country_name: "Egypte",
                  country_flag: "egypt.svg",
                  photo_link: "https://holidaymasr.com/wp-content/uploads/2018/10/Luxor-main-image-600x600.jpg")
puts "destination 13 done"
Destination.create(destination_name: "Tokyo",
                  country_name: "Japon",
                  country_flag: "japan.svg",
                  photo_link: "http://blog.nicolinepatricia.com/wp-content/uploads/2017/10/Tokyo_Shibuya_Nicoline-Patricia-Malina_03641-600x600.jpg")
puts "destination 14 done"
Destination.create(destination_name: "Perth",
                  country_name: "Australie",
                  country_flag: "australia.svg",
                  photo_link: "https://www.australie-van.fr/wp-av-content/uploads/2018/01/Perth-Australie-min-600x600.jpg")
puts "destination 15 done"
Destination.create(destination_name: "Mumbai",
                  country_name: "Inde",
                  country_flag: "india.svg",
                  photo_link: "https://indiatrotter.com/wp-content/uploads/2018/11/taj_mahal-1-600x600.jpg")
puts "destination 16 done"

Destination.pluck(:destination_name).each do |city|
  puts "======= Scrapping #{city} ========="
  url = "https://www.numbeo.com/cost-of-living/in/#{city}?displayCurrency=EUR"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.data_wide_table').each do |item|
    destination = Destination.find_by(destination_name: city)
    destination.update(
      banana_price: item.text.match(/Banana.+€/)[0],
      water_price: item.text.match(/Water.\W1.5.+€/)[0],
      transport_price: item.text.match(/One-way Ticket.+€/)[0],
      capuccino_price: item.text.match(/Cappuccino.+€/)[0],
      beer_price: item.text.match(/Domestic Beer.+€/)[0],
      pepsi_price: item.text.match(/Coke.Pepsi.+€/)[0]
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
