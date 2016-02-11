class ProductsController < ApplicationController
  http_basic_authenticate_with name:"admin", password:"secret", except: [:index, :show]

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
      flash[:success] = "#{@product.title} saved! ^_^"
      redirect_to @product
    else
      @errors = @product.errors
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to @product
    else
      @errors = @product.errors
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:title, :description, :price, :inventory, :picture)
  end
end
