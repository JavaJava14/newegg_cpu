class NeweggCpu::Scraper

  def self.get_cpu
    x = 0
    url = "https://www.newegg.com/p/pl?Submit=ENE&IsNodeId=1&N=100007671%2050001028&cm_sp=Cat_CPU-Processors_2-_-Visnav-_-AMD-CPU_2"
    unparsed = HTTParty.get(url) #Raw HTML
    parsed = Nokogiri::HTML(unparsed) #Readable format
    processors_list = parsed.css('div.item-container')#36 items
    processors_list.each do |processor| #Iterate over 36 items
      name = processor.css("a.item-title").text
      price = processor.css('li.price-current').text
      url = processor.css('a')[0].attributes["href"].value 
      puts "#{x+=1}. " << name
      NeweggCpu::Cpu.new(name,price,url)#calls initialize method 
    end
  end
end