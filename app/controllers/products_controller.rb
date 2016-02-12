class ProductsController < ApplicationController
  before_filter :render_to_authorized, except: [:index, :show]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @categories = Category.all
  end

  def edit
    @product = Product.find(params[:id])

    # if is_admin?
    #   render_to
    # end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      if params[:product][:category_ids].length == 1
         @defaultCategory = Category.find_by(name: 'default')
         @defaultCategory.products  << @product
          flash[:success] = "#{@product.title} did not get a assigned category, and was given the default category ^_^"
      else
        params[:product][:category_ids].pop
        params[:product][:category_ids].each do |category_id|
          Category.find(category_id).products << @product
        end
      end

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
      @product.categories = []
      if params[:product][:category_ids].length == 1
         @defaultCategory = Category.find_by(name: 'default')
         @defaultCategory.products  << @product
          flash[:success] = "#{@product.title} did not get a assigned category, and was given the default category ^_^"
      else
        params[:product][:category_ids].pop
        params[:product][:category_ids].each do |category_id|
          Category.find(category_id).products << @product
        end
      redirect_to '/admin/index'
      end
    else
      @errors = @product.errors
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to "/admin/index"
  end

  private
  def product_params
    params.require(:product).permit(:title, :description, :price, :inventory, :picture, :category_ids)
  end
end
