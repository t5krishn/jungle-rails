require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before(:each) do
      @category = Category.new
      @category.save
      @product = Product.new(
        name: "new prod name",
        price: 12321,
        quantity: 12,
        category: @category)
    end

    it "is valid with valid attributes" do
      @product.save
      expect(@product).to be_valid
    end
  
    it "is not valid without a name" do
      @product.name = nil
      @product.save
      expect(@product).to_not be_valid
    end
    
    it "is not valid without a price" do
      @product.price_cents = nil
      @product.save
      expect(@product).to_not be_valid
    end

    it "is not valid without a quantity" do
      @product.quantity = nil
      @product.save
      expect(@product).to_not be_valid
    end

    it "is not valid without a category" do
      @product.category = nil
      @product.save
      expect(@product).to_not be_valid
    end

  end
end
