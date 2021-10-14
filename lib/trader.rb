require 'nokogiri'
require 'open-uri'

def crypto_scrapper
    page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))


    nb = page.xpath("/html/body/div/div/div[2]/div/div/div/div[2]/div[3]/div/table/tbody/tr").to_s.scan(/(<tr)/).count
    name = []
    price = []

    (1..nb).each do |i|
        name << page.xpath("/html/body/div/div/div[2]/div/div/div/div[2]/div[3]/div/table/tbody/tr[#{i}]/td[3]/div").text
        price << page.xpath("/html/body/div/div/div[2]/div/div/div/div[2]/div[3]/div/table/tbody/tr[#{i}]/td[5]/div/a").text.delete_prefix('$').delete(',').to_f
    end
    
    
    hash = {}
    hash_array = []
    name.each do |i|
        hash[i] = price[name.rindex(i)]
    end


    hash.each {|k,v| hash_array << {k => v}} 

    return hash_array
end

#"/html/body/div/div/div[2]/div/div/div/div[2]/div[3]/div/table/tbody/tr[#{i}]/td[3]/div"
#"/html/body/div/div/div/div/div/div/div[2]/div[3]/div/table/tbody/tr[#{i}]/td[3]/div"

#/html/body/div/div/div[2]/div/div/div/div[2]/div[3]/div/table/tbody/tr
#/html/body/div/div/div[2]/div[1]/div[2]/div[2]/div[2]/div[3]/div/table/tbody/tr