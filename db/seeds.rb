# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'nokogiri'
require_relative 'destination'

url = "https://www.numbeo.com/cost-of-living/in/Madrid"
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

entries = url.css('.data_wide_table')
transport_price = entries.css('table')[0].css('tr')[30].css('.priceValue').text
banana_price = entries.css('table')[0].css('tr')[18].css('.priceValue').text
water_price = entries.css('table')[0].css('tr')[8].css('.priceValue').text


html_doc.search('.priceValue').each do |element|
  puts element.text.strip
  puts element.attribute('href').value
end
