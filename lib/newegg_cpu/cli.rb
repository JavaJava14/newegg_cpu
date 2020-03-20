class NeweggCpu::CLI

  def call
    greet
    menu
  end

  def greet
    puts "\nNewegg featured items from Desktop Processors"
    puts "\nWelcome"
    puts ""
  end

  def generate_list 
    NeweggCpu::Scraper.get_cpu
  end

  def menu
    puts "Enter search to find featured items."
    puts "Enter exit to exit program."
    input = gets.chomp
    case input.downcase
      when "search"
        puts ""
        generate_list
      when "list"
      when "exit"
        puts ""
        puts "come back soon!"
        exit
      else
        puts ""
        puts "Sorry, that input is not recognized."
        puts ""
        menu
    end
  end
end