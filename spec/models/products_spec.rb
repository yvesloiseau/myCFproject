require 'rails_helper'
# describe block
describe Product do

  context "when the product has comments" do
    before do
      #here you put your code to generate test content
      @product = Product.create!(name: "Sun Mountain cart bag SM-100",
                                  description: "This is a product for testing",
                                  product_type: "bag",
                                  brand: "Sun Mountain",
                                  price: 89.99)
      @user = User.create!( email: "yves.loiseau@videotron.ca",
                            password: "Guy05Laine",
                            first_name: "Yves",
                            last_name: "Loiseau")
      @product.comments.create!(rating: 1, user: @user, text: "Awful bag!")
      @product.comments.create!(rating: 3, user: @user, text: "I like this bag!")
      @product.comments.create!(rating: 5, user: @user, text: "This bag is very practical")
    end

    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq 3
    end

    it "returns the highest rating of all comments" do
      expect(@product.comments.rating_desc.first.rating).to eq 5
    end

    it "returns the lowest rating of all comments" do
      expect(@product.comments.rating_desc.last.rating).to eq 1
    end

    it "verify if description is not blank" do
      # validtion of description presence
      expect(@product.description).not_to eq ""
    end

  context "search products is working" do
    before do
      @search_term = "Sun Mountain cart bag SM-100"

      Product.create!(name: "Sun Mountain cart bag SM-100",
                                  description: "This is a product for testing",
                                  product_type: "bag",
                                  brand: "Sun Mountain",
                                  price: 89.99)

      Product.create!(name: "Taylor Made cart bag",
                                  description: "This is a product for testing",
                                  product_type: "bag",
                                  brand: "Sun Mountain",
                                  price: 89.99)

      Product.create!(name: "Taylor Made carry bag",
                                  description: "This is a product for testing",
                                  product_type: "bag",
                                  brand: "Sun Mountain",
                                  price: 89.99)
      Rails.env = "development"
    end
    it "validate product name from search method" do
      expect(Product.search(@search_term)[0].name).to eq "Sun Mountain cart bag SM-100"
    end
  end

  context "validation of product fields to be mandotary" do

    it "product not valid wihout a name" do
      expect(Product.new(description:
        "This is a product for testing")).not_to be_valid
    end

    it "product not valid with no description" do
      expect(Product.new(name:
        "Sun Mountain cart bag SM-100", description: "")).not_to be_valid
    end

    it "product not valid with no brand" do
      expect(Product.new(name: "Sun Mountain cart bag SM-100",
        description: "This is a product for testing")).not_to be_valid
    end

    it "product not valid with no type" do
      expect(Product.new(name: "Sun Mountain cart bag SM-100",
        description:
        "This is a product for testing", brand: "Sun Mountain")).not_to be_valid
    end

    it "product not valid with no price" do
      expect(Product.new(name: "Sun Mountain cart bag SM-100",
        description: "This is a product for testing",
        brand: "Sun Mountain", product_type: "bag")).not_to be_valid
    end

    it "product to be valid with all required fields present" do
      expect(Product.new(name: "Sun Mountain cart bag SM-100",
        description: "This is a product for testing", brand: "Sun Mountain",
        product_type: "bag", price: 89.99)).to be_valid
    end

  end

  end
end