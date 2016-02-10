require 'rails_helper'

RSpec.describe Product, type: :model do

  let(:product_no_title) {Product.new(description: "this is the description", price: 10)}
  let(:product_no_description) {Product.new(title: "this is the title", price: 20)}
  let(:product_no_price) {Product.new(title: "this is the title", description: "another description")}
  let(:product_negative_price) {Product.new(title: "this is the title", description: "another description", price: -20)}
  let(:good_product) {Product.new(title: "this is the title", description: "another description", price: 20)}

  describe 'validations' do
    context 'raises an error' do
        it 'product has no title' do
            product_no_title.save
            expect(product_no_title.errors[:title]).to include("can't be blank")
        end

        it 'product has no description' do
            product_no_description.save
            expect(product_no_description.errors[:description]).to include("can't be blank")
        end

        it 'product has no price' do
            product_no_price.save
            expect(product_no_price.errors[:price]).to include("can't be blank")
        end

        it 'product has negative price' do
            product_negative_price.save
            expect(product_negative_price.errors[:price]).to include("must be greater than or equal to 0")
        end
    end

    context 'no error message' do
        it 'product has title, description, price, and price is not negative' do
            expect{good_product.save}.to change{Product.count}.by(1)
        end
    end

  end
end
