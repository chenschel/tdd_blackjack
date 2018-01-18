# frozen_string_literal: true

class BasicStrings
  attr_accessor :sentence

  def initialize(sentence)
    @sentence = sentence
  end

  def contains_word?(word)
    sentence.include?(word)
  end

  def contains_word_ignorecase?(word)
    sentence.downcase.include?(word.downcase)
  end
end
