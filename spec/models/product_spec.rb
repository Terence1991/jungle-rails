require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it " should not valid without a name" do
      product = Product.new(name: nil, price: 100, quantity: 10, category: Category.new) 
      expect(product).to_not be_valid
    end
    it "it should not be valid without a price" do
      product = Product.new(name: "matt damon", price: nil, quantity: 10, category: Category.new)
      expect(product).to_not be_valid
    end
    it "should not be valid without a quantity" do
      product = Product.new(name: "matt damon", price: 10, quantity: nil, category: Category.new)
      expect(product).to_not be_valid
    end 
    it " should not be valid without a category" do
      product = Product.new(name: "matt damon", price: 10, quantity: 10, category: nil) 
      expect(product).to_not be_valid
  end
  end
end