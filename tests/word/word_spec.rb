# frozen_string_literal: true

require_relative 'word'

RSpec.describe Word do
  context 'is a Palindrom' do
    it 'should returns true' do
      given = 'Otto'
      output = Word.palindrom?(given)
      expect(output).to be_truthy
    end
  end

  context 'is not a Palindrom' do
    it 'should returns false' do
      given = 'Adam'
      output = Word.palindrom?(given)
      expect(output).to be_falsey
    end
  end
end
