# frozen_string_literal: true

require_relative 'strings'

RSpec.describe BasicStrings do
  before do
    @test_word = 'Ruby'
  end

  subject { BasicStrings.new('There is a gemstone called ruby in existance') }

  context 'case-sensetive' do
    it 'should output interpolated text' do
      result = subject.contains_word?(@test_word)

      expect(result).to be_falsey
    end
  end

  context 'case-insensetive' do
    it 'should output interpolated text' do
      result = subject.contains_word_ignorecase?(@test_word)

      expect(result).to be_truthy
    end
  end
end
