require_relative './word.rb'
require 'nokogiri'
require 'open-uri'
require 'pry'

class CLI
  def call
    create_words
    list_words
    menu
    goodbye
  end

  def create_words
    word_1_hash = scrape_webster
    word_2_hash = scrape_wiktionary
    Word.create_from_hash(word_1_hash)
    Word.create_from_hash(word_2_hash)
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

  def scrape_wiktionary(url= "https://en.wiktionary.org/wiki/Wiktionary:Word_of_the_day")
    wod_page = Nokogiri::HTML(open(url))
    word_attrs ={}
    word_attrs[:name] = wod_page.css("div#mf-wotd table span#WOTD-rss-title").text
    word_attrs[:part_of_speech] = wod_page.css("div#mf-wotd table i").text
    word_attrs[:definition] = wod_page.css("div#mf-wotd div#WOTD-rss-description").text
    word_attrs
  end

  def scrape_webster(url="https://www.merriam-webster.com/word-of-the-day")
    wod_page = Nokogiri::HTML(open(url))
    word_attrs ={}
    word_attrs[:name] = wod_page.css("div.word-and-pronunciation h1").text
    word_attrs[:part_of_speech] = wod_page.css("div.word-attributes span.main-attr").text
    word_attrs[:definition] = wod_page.css("div.wod-definition-container p").first.text
    word_attrs
  end
end