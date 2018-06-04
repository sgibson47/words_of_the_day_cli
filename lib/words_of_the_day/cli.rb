require_relative './word.rb'
require_relative './scraper.rb'
class CLI
  def call
    scraper = Scraper.new
    scraper.scrape_webster
    list_words
    menu
    goodbye
  end

  def list_words
    puts "Today's Words"
    Word.all.each_with_index {|word, i|
      puts "#{i +1}. #{word.name}"}
    puts "\n"
  end 

  def menu
    puts "Enter a number to learn more about the"
    puts "corresponding word or enter exit to quit."

    input = nil

    while input != "exit"
      input = gets.strip
      if input.to_i > 0 && input.to_i <= Word.all.length
        word = Word.all[input.to_i - 1]
        word.display_details
      elsif input == "exit"
        break
      else
        puts "Please enter a number from the list or exit."
      end
    end
  end

  def goodbye
    puts "Bye! Come back tomorrow for new words!"
  end
end