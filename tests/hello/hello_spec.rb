# frozen_string_literal: true

require_relative 'hello'

RSpec.describe Hello do
  it 'should return Hello world' do
    greetings = Hello.say_hello

    expect(greetings).to eq('Hello world!')
  end
end
