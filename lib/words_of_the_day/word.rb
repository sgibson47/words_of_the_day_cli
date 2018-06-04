class Word
  attr_accessor :name, :definition, :part_of_speech

  @@all = []

  def self.all
    @@all
  end

  def display_details
    puts "#{self.name}".upcase
    puts "Part of speech: #{self.part_of_speech}"
    puts "Definition: #{self.definition}"
  end

  word_1 = Word.new
  word_1.name = "proficient"
  word_1.definition = "well advanced in an art, occupation, or branch of knowledge"
  word_1.part_of_speech = "adjective"
  @@all<<word_1

  word_2 = Word.new
  word_2.name = "atavism"
  word_2.definition = "reversion to an earlier type; throwback"
  word_2.part_of_speech = "noun"
  @@all<<word_2

  word_3 = Word.new
  word_3.name = "Precipitous"
  word_3.definition = "Done rashly: acting too quickly and without sufficient thought"
  word_3.part_of_speech = "adj"
  @@all<<word_3
end