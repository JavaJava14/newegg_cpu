class NeweggCpu::Scraper

  def self.get_cpu
    url = "https://www.newegg.com/p/pl?Submit=ENE&IsNodeId=1&N=100007671%2050001028&cm_sp=Cat_CPU-Processors_2-_-Visnav-_-AMD-CPU_2"
    unparsed = HTTParty.get(url) #Raw HTML
    parsed = Nokogiri::HTML(unparsed) #Readable format
    processors_list = parsed.css('div.item-container')#36 items

end