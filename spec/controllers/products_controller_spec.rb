require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

   before do
      5.times do
        Product.create!
      end
    end

  describe 'index action' do

    it 'should load all the products' do
      get :index
      expect(assigns[:products]).to_not be_blank
      expect(response).to render_template(:index)
    end
  end

  describe 'show action' do

    it 'should load one product' do
      new_product = Product.create!
      get :show, id: new_product
      expect(assigns[:product]).to_not be_blank
      expect(response).to render_template(:show)
    end
  end

  describe 'new action' do

    it 'should create a new product' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'should save a newly created product' do

      good_product_params = {title: "test title", description: "test description", price: 1, inventory: 0}

      expect{post :create, product: good_product_params}.to change{Product.count}.by(1)

      expect(assigns[:product]).to be_a Product
    end
  end

  describe 'edit action' do

    it 'should edit one product' do
      this_product = Product.create!
      get :edit, id: this_product
      expect(assigns[:product]).to_not be_blank
      expect(response).to render_template(:edit)
    end

    let(:new_title) {"updated title"}
    let(:edit_product) {Product.create(title: "test title", description: "edited description", price: 5, inventory: 1)}

    it 'should save a newly edited product' do

      # edit_product_params = {title: "edited title", description: "edited description", price: 5, inventory: 1}

      patch :update, id: edit_product.id, product: {title: new_title}

      expect(edit_product.title).to eq(new_title)

    end
  end

  describe 'destroy action' do


    it 'should delete one product' do
    end
  end
end
