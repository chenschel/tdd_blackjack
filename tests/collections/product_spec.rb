# frozen_string_literal: true

require_relative 'product'

RSpec.describe Product do
  before(:all) do
    @p1 = Product.new(id: 2, name: 'Item1', quantity: 3, price: 25)
    @p2 = Product.new
    @p3 = Product.new(id: 2, name: 'Item2')
    @p4 = Product.new(id: 3, name: 'Item3')
  end

  describe 'responde to attriutes' do
    it 'resonde to id' do
      expect(@p1).to respond_to(:id)
    end

    it 'resonde to name' do
      expect(@p1).to respond_to(:name)
    end

    it 'resonde to quantity' do
      expect(@p1).to respond_to(:quantity)
    end

    it 'resonde to price' do
      expect(@p1).to respond_to(:price)
    end
  end

  context 'resonse to class methods correnclty' do
    it 'resonse to class method all' do
      expect(Product).to respond_to(:all)
    end

    it 'should returns all product' do
      expect(Product.all).to eq([@p1, @p2, @p3, @p4])
    end

    it 'resonse to class method names' do
      expect(Product).to respond_to(:names)
    end

    it 'should returns all product names' do
      expect(Product.names).to eq([@p1.name, @p2.name, @p3.name, @p4.name])
    end

    it 'resonse to class method all_sold_out' do
      expect(Product).to respond_to(:all_sold_out)
    end

    it 'should return all products which are sold out' do
      expect(Product.all_sold_out).to eq([@p2, @p3, @p4])
    end
  end

  context 'produt value set by contruct' do
    it 'should returns the correct id' do
      expect(@p1.id).to eq(2)
    end

    it 'should returns the correct name' do
      expect(@p1.name).to eq('Item1')
    end

    it 'should returns the correct quantity' do
      expect(@p1.quantity).to eq(3)
    end

    it 'should returns the correct price' do
      expect(@p1.price).to eq(25)
    end
  end

  context 'produt value set by contruct' do
    it 'should returns the correct id' do
      expect(@p2.id).to eq(1)
    end

    it 'should returns the correct name' do
      expect(@p2.name).to eq('Test product')
    end

    it 'should returns the correct quantity' do
      expect(@p2.quantity).to eq(0)
    end

    it 'should returns the correct price' do
      expect(@p2.price).to eq(0.0)
    end

    it 'should returns all product' do
      expect(Product.all).to eq([@p1, @p2, @p3, @p4])
    end

    it 'should respond to total_inventory' do
      expect(Product).to respond_to(:total_inventory)
    end

    it 'should returns the inventory of all Products' do
      expect(Product.total_inventory).to eq(75.0)
    end
  end
end
