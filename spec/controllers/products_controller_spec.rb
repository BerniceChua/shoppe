require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  include AdminHelper, SessionsHelper, UsersHelper

  describe 'index action' do

    before do
      @all_products = 5.times.map do |count|
        Product.create!(title: "Item #{count}", price: rand(1..10), description: "Our #{count} item!", picture: "/link/to/the_picture_#{count}.png")
      end
    end

    it 'should load all the products' do
      get :index
      expect(assigns[:products]).to_not be_blank
      expect(response).to render_template(:index)
    end
  end

  describe 'show action' do

    it 'should load one product' do
      new_product = Product.create!(title: "Item", price: rand(1..10), description: "Our item!", picture: "/link/to/the_picture.png")
      get :show, id: new_product
      expect(response.status).to eq(200)
      expect(assigns[:product]).to_not be_blank
      expect(response).to render_template(:show)
    end
  end

  describe 'new action' do

    context "not logged in as admin" do
      it 'should NOT render the form page for "new product" ' do
        get :new
        expect(response).to_not render_template(:new)
        expect(response).to render_template(:unauthorized)
      end
    end

    context "logged in as admin" do
      # rake db:seed RAILS_ENV=test
      # to seed the test DB
      test_admin = User.find(1)

      it 'should render the form page for "new product" ' do
        login(test_admin)
        get :new
        expect(response.status).to eq(200)
        expect(response).to render_template(:new)
      end

      it 'should save a newly created product' do
        login(test_admin)

        good_product_params = {title: "test title", description: "test description", price: 1, inventory: 0}
        expect{post :create, product: good_product_params}.to change{Product.count}.by(1)
        expect(assigns[:product]).to be_a Product
      end

    end

  end

  describe 'edit action' do
    test_admin = User.find(1)

    it 'should render edit page' do
      login(test_admin)

      this_product = Product.create!(title: "Item", price: rand(1..10), description: "Our item!", picture: "http://www.link.com/to/the_picture.png")
      get :edit, id: this_product
      expect(assigns[:product]).to_not be_blank
      expect(response).to render_template(:edit)
    end

    let(:new_title) {"updated title"}
    let(:edit_product) {Product.create!(title: "test title", description: "edited description", price: 5, inventory: 1)}

    it 'should save a newly edited product' do
      login(test_admin)

      put :update, id: edit_product.id, product: {title: new_title}
      expect(edit_product.reload.title).to eq(new_title)
    end
  end

  describe 'destroy action' do

    let(:unwanted_product) {Product.create!(title: "Item", price: rand(1..10), description: "Our item!", picture: "http://www.link.com/to/the_picture.png")}
    test_admin = User.find(1)

    it 'should delete one product' do
      login(test_admin)

      id = unwanted_product.id
      expect{delete :destroy, id: id}.to change{Product.count}.by(-1)
    end
  end


end
