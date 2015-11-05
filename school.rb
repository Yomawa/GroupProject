require 'rubygems'
require 'open-uri'
require 'pry'
#require 'curb'
require 'nokogiri'
url = "https://www.coursereport.com/schools?track=Full-Stack+Web+Development&location=San+Francisco"
doc = Nokogiri::HTML(open(url))
#puts doc.at_css(".school-header").text
#puts doc.at_css(".description").text

# doc.css(".school-header").each do |name|
#   puts name.at_css("p.description").text
# end
#puts doc.css("body").text
#puts doc.css("h1").text
#puts doc.css("div").text
#puts doc.css("ul").text
#puts doc.css(".school-image").text
#puts doc.css("#main-content").text
#puts doc.css("p.span").text
# doc.css("#main-content").each do |main|
#   schoolname = main.at_css(".school-header").text
#   des = main.at_css(".description").text
#   #puts "#{schoolname} - #{des}"
#   puts schoolname, "\n", des, "\n\n"
# end

doc.css("ul#schools").css('.school-header').css('h3').css('a').each do |main|
  puts main.text
end

# doc.css('p.description').each do |main|
#   puts main.next_element.next_element.text + "\n\n"
# end

# doc.css(".school-header").each do |name|
#   puts name.at_css(".school-header, .description").text.strip
# end

