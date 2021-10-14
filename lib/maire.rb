require 'nokogiri'
require 'open-uri'

def get_townhall_email(url)
    page = Nokogiri::HTML(URI.open(url))
    email = page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
    return email
end

def get_townhall_name(url)
    page = Nokogiri::HTML(URI.open(url))
    name = page.xpath("/html/body/div/main/section[1]/div/div/div/h1").text.split.first
    return name
end

def get_townhall_urls 
    page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
    urls = []
    page.xpath("//*[contains(@class, 'lientxt')]/@href").each do |i|
        urls << "http://annuaire-des-mairies.com" + i.to_s.delete_prefix('.')
    end
    return urls
end

def perform
    get_townhall_urls.each_index {|i| puts get_townhall_email(get_townhall_urls[i]) + " : " + get_townhall_name(get_townhall_urls[i])}
end

perform

#puts get_townhall_urls.each {|i| get_townhall_email(get_townhall_urls)}


#p doc.xpath ('// div [@ class = "chaleur"] / a'). map {| lien | lien ['href']} 
#a_elt = doc.at('a:contains("MY TEXT")') 

#content = page.at('.content')
#content.css('.col').each do |col|
#    puts col.at('h5').text
#end

#doc.xpath("//*[contains(concat(' ', normalize-space(@class), ' '), ' #{class_name} ')]")