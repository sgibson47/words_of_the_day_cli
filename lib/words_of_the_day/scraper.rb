require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def scrape_webster(url="https://www.merriam-webster.com/word-of-the-day")
    word_page = Nokogiri::HTML(open(url))
    binding.pry
    word_attrs ={}
    # word_attrs[:name] = word_page.css("div.word-and-pronunciation h1").text
    # word_attrs[:part_of_speech] = word_page.css("div.word-attributes span.main-attr").text
    # word_attrs[:definition] = word_page.css("div.wod-definition-container p").first.text
    #word_attrs
  end

  def scrape_dictionary(url= "http://www.dictionary.com/wordoftheday/")
    word_page = Nokogiri::HTML(open(url))
    word_attrs ={}
    # word_attrs[:name] = word_page.css("").text
    # word_attrs[:part_of_speech] = word_page.css("").text
    # word_attrs[:definition] = word_page.css("").text
    #word_attrs
  end

  def scrape_wordthink(url="http://www.wordthink.com/")
    word_page = Nokogiri::HTML(open(url))
    word_attrs ={}
    # word_attrs[:name] = word_page.css("").text
    # word_attrs[:part_of_speech] = word_page.css("").text
    # word_attrs[:definition] = word_page.css("").text
    #word_attrs
  end

end
