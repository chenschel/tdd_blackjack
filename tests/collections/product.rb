# frozen_string_literal: true

class Product
  attr_accessor :id, :name, :quantity, :price
  @@products = []

  def initialize(data = {})
    @id = data.dig(:id) || 1
    @name = data.dig(:name) || 'Test product'
    @quantity = data.dig(:quantity) || 0
    @price = data.dig(:price) || 0.0

    @@products << self
  end

  def self.all
    @@products
  end

  def self.names
    @@products.map(&:name)
  end

  def self.all_sold_out
    @@products.select { |pr| pr.quantity.zero? }
  end

  def self.total_inventory
    @@products.reduce(0) { |sum, pr| sum + pr.quantity * pr.price }
  end
end
