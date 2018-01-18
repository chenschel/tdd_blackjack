# frozen_string_literal: true

class Calculator
  def self.add(x, y)
    x + y
  end

  def self.subtract(x, y)
    x - y
  end

  def self.multi(x, y)
    x * y
  end

  def self.devide(x, y)
    x.to_f / y.to_f
  end

  def self.power(x, y)
    x**y
  end
end
