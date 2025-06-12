require 'nokogiri'
require 'open-uri'

url = "https://news.ycombinator.com/"

begin
  html = URI.open(url)
  doc = Nokogiri::HTML(html)

  puts "Títulos de las noticias en Hacker News:\n\n"
  doc.css('.athing .titleline a').each_with_index do |link, i|
    puts "#{i+1}. #{link.text.strip}"
  end
rescue => e
  puts "Error al acceder a la página: #{e.message}"
end
