require 'rails_helper'
RSpec.describe Product, type: :model do
  describe 'Validations' do

    before(:each) do
      @category = Category.create({name: "Trees"})
      @product = Product.create({name: "Bush", 
      price: 150, 
      quantity: 5,
      category: @category
      })
    end
    
    it "is valid with attributes" do
      expect(@product).to be_valid
    end
    
    it "is not valid without a name" do
      @product.name = nil
      expect(@product).to_not be_valid
    end

    it "is not valid without a price" do
      @product.price = ""
      expect(@product).to_not be_valid
    end

    it "is not valid without a quantity" do
      @product.quantity = ""
      expect(@product).to_not be_valid
    end

    it "is not valid without a category" do
      @product.category = nil
      expect(@product).to_not be_valid
    end

    it "is not valid without a name" do
      @product.name = nil
      expect(@product).to_not be_valid
    end

    it "tested to nil" do
      expect(@product).to be_nil
      expect(@products.errors.full_messages)
    end    
    

  end
end
