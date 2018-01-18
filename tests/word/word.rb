# frozen_string_literal: true

class Word
  def self.palindrom?(word)
    word.downcase == word.downcase.reverse
  end
end
