class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      p product_params
      p params
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
  def product_params
    params.require(:product).permit(:title, :description, :price, :inventory)
  end
end
