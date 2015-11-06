require 'rubygems'
require 'open-uri'
require 'pry'
#require 'curb'
require 'nokogiri'

# # SCHOOL NAME
# url = "https://www.switchup.org/coding-bootcamps-reviews?location=27"
# doc = Nokogiri::HTML(open(url))

# doc.css(".thumbnail-info").css('h4').css('.topic-title').css('a').each do |main|
#   puts main.text
# end

# # ADDRESS
# url = "https://www.switchup.org/coding-bootcamps-reviews?location=27"
# doc = Nokogiri::HTML(open(url))

# doc.css(".thumbnail-info").css('h5').css('.topic-location').each do |main|
#   puts main.text
# end

# #DESCRIPTION
url = "https://www.switchup.org/coding-bootcamps-reviews?location=27"
doc = Nokogiri::HTML(open(url))

# schoolname = main.at_css('.topic-title a').text
#   address = main.at_css('.topic-location').text
  
#   description = main.at_css('.topic-summary').text unless main.at_css('.topic-summary').nil?
#   #puts schoolname.text, "\n", address.text
#   # binding.pry
#   School.create({name: schoolname, address: address, description: description})
# end

# doc.css(".thumbnail-info").css('.topic-summary').each do |main|
#   puts main.text
# end





together 
results = doc.css(".thumbnail-info").map do |main|
  
  schoolname = main.at_css('.topic-title a').text
  address = main.at_css('.topic-location').text
  description = main.at_css('.topic-summary').text if !main.at_css('.topic-summary').nil?
  #puts schoolname.text, "\n", address.text
  # binding.pry
  {name: schoolname, address: address, description: description}
end

puts results

#testing







