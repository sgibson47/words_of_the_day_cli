require 'nokogiri'
require 'open-uri'

class Word
  attr_accessor :definition, :part_of_speech, :name

  @@all = []

  def self.all
    @@all
  end

  def display_details
    puts "#{self.name}".upcase
    puts "Part of speech: #{self.part_of_speech}"
    puts "Definition: #{self.definition}"
  end

  def name=(name)
    @name = name
  end 

  def self.create_from_hash(hash)
    thing = Word.new
    hash.each do |k,v|
      thing.send("#{k}=", v)
    end
    @@all<<thing
  end
end