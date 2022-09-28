require 'rails_helper'

# validates :name, presence: true
# validates :price, presence: true
# validates :quantity, presence: true
# validates :category, presence: true

RSpec.describe Product, type: :model do

  describe 'Validations' do
    
    it "should have valid attribute: name, price, quantity and category" do
      @category = Category.new
      @category.id = 2
      @category.name = "test"

      @product = Product.new
      @product.name = "test"
      @product.price = 100
      @product.quantity = 100
      @product.category_id = @category

      @category.products = [@product]

      @product.save

      expect(@product).to be_valid
    end

    it "should have the product name" do
      @category = Category.new
      @category.id = 2
      @category.name = "test"

      @product = Product.new
      @product.name = nil
      @product.price = 100
      @product.quantity = 100
      @product.category_id = @category

      @category.products = [@product]
      @product.save

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "should have the product price" do
      @category = Category.new
      @category.id = 2
      @category.name = "test"

      @product = Product.new
      @product.name = "test"
      @product.price_cents = nil
      @product.quantity = 100
      @product.category_id = @category

      @category.products = [@product]

      @product.save

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "should have the product quantity" do
      @category = Category.new
      @category.id = 2
      @category.name = "test"

      @product = Product.new
      @product.name = "test"
      @product.price = 100
      @product.quantity = nil
      @product.category_id = @category

      @category.products = [@product]

      @product.save

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "should have the product in correct category" do
      @category = Category.new
      @category.id = 2
      @category.name = "test"

      @product = Product.new
      @product.name = nil
      @product.price = 100
      @product.quantity = 100
      @product.category_id = nil

      @category = [@product]

      @product.save

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end