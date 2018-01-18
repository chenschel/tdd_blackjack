# frozen_string_literal: true

class Student
  attr_accessor :first_name, :last_name
  @@total_count = 0

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @@total_count += 1
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.total_count
    @@total_count
  end
end
