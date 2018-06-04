require 'nokogiri'
require 'open-uri'
require 'pry'

class Scrape_webster
  attr_accessor :attrs

  def initialize(url="https://www.merriam-webster.com/word-of-the-day")
    wod_page = Nokogiri::HTML(open(url))
    word_attrs ={}
    word_attrs[:name] = wod_page.css("div.word-and-pronunciation h1").text
    word_attrs[:part_of_speech] = wod_page.css("div.word-attributes span.main-attr").text
    word_attrs[:definition] = wod_page.css("div.wod-definition-container p").first.text
    @attrs = word_attrs
  end
end


class Scrape_wiktionary
  def initialize(url= "https://en.wiktionary.org/wiki/Wiktionary:Word_of_the_day")
    wod_page = Nokogiri::HTML(open(url))
    word_attrs ={}
    word_attrs[:name] = wod_page.css("div#mf-wotd table span#WOTD-rss-title").text
    word_attrs[:part_of_speech] = wod_page.css("div#mf-wotd table i").text
    word_attrs[:definition] = wod_page.css("div#mf-wotd div#WOTD-rss-description").text
    @attrs = word_attrs
  end

end
