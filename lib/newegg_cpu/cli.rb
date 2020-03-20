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

  def select_product
    puts ""
    puts "Enter any number from 1 through 36 to learn about the product"
    input = gets.chomp.to_i
    if input > 0 && input <= NeweggCpu::Cpu.all.length# 1-36
     NeweggCpu::Cpu.all[input - 1].tap do |item|
      puts ""
      puts "#{item.name}"
      puts "#{item.price}".gsub(/[\\nt–]/, "").strip
      puts "#{item.url}"
      select_product_continued
     end
    else 
      puts ""
      puts "You must enter a valid number"
      select_product
    end 
  end

    def select_product_continued
      puts ""
      puts "Enter list to view info on featured items or menu"
      input = gets.chomp
      case input.downcase
        when "menu" 
          puts ""
          puts "Enter list to view info on featured items."
          menu
        when "list"
          select_product
        else
        puts "Invalid response"
        select_product_continued
      end
    end

  def menu
    puts "Enter search to find featured items."
    puts "Enter exit to exit program."
    input = gets.chomp
    case input.downcase
      when "search"
        puts ""
        generate_list
        select_product
      when "list"
        select_product
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