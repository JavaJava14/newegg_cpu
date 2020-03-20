class NeweggCpu::CLI

  def call
    greet
  end

  def greet
    puts "\nNewegg featured items from Desktop Processors"
    puts "\nWelcome"
    puts ""
  end

  def generate_list 
    NeweggCpu::Scraper.get_cpu
  end

end