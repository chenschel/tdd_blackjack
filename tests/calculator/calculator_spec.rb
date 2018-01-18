# frozen_string_literal: true

require_relative 'calculator'

RSpec.describe Calculator do
  before do
    @first = 10
    @second = 50
  end

  context 'adding two numbers together' do
    it 'should return the sum of two numbers' do
      result = Calculator.add(@first, @second)
      expect(result).to eq(60)
    end
  end

  context 'subtracting one number from the other' do
    it 'should return the difference' do
      result = Calculator.subtract(@first, @second)
      expect(result).to eq(-40)
    end
  end

  context 'multilying two numbers' do
    it 'should return the product of the given numbers' do
      result = Calculator.multi(@first, @second)
      expect(result).to eq(500)
    end
  end

  context 'deviding two numbers' do
    it 'should return the devision' do
      result = Calculator.devide(@first, @second)
      expect(result).to eq(0.2)
    end
  end

  context 'power tow numbers' do
    it 'should return exponent' do
      result = Calculator.power(2, 10)
      expect(result).to eq(1024)
    end
  end
end
