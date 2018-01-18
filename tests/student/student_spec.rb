# frozen_string_literal: true

require_relative 'student'

RSpec.describe Student do
  subject { Student.new('John', 'Doe') }
  describe 'instance methods' do
    it { respond_to(:first_name) }
    it { respond_to(:last_name) }
    it { respond_to(:full_name) }
  end

  describe 'total number of Students created' do
    it 'should have 2 Students in total' do
      Student.new('John', 'Doe')
      Student.new('Jane', 'Doe')
      expect(Student.total_count).to eq(2)
    end
  end

  describe 'check if mehtods works correctly' do
    it 'first name should be John' do
      expect(subject.first_name).to eq('John')
    end

    it 'last name should be Doe' do
      expect(subject.last_name).to eq('Doe')
    end

    it 'full name should be John Doe' do
      expect(subject.full_name).to eq('John Doe')
    end
  end
end
