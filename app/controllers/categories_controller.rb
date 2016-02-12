class CategoriesController < ApplicationController
	before_filter :render_to_authorized, except: [:index, :show]
	def index
		@categories = Category.all
	end

	def show
		@category = Category.find(params[:id])
	end

  	def new
	end

	def edit
		@category = Category.find(params[:id])
	end

	def create
	    @category = Category.new(category_params)

	      if @category.save
	            flash[:success] = "#{@category.title} saved! ^_^"
	            redirect_to @category
	      else
	            @errors = @category.errors
                  render 'new'
		end
	end

	def update
	    @category = Category.find(params[:id])

	    if @category.update(category_params)
	      redirect_to @category
	    else
	      @errors = @category.errors
	      render 'edit'
	    end
	  end

	  def destroy
	    @category = Category.find(params[:id])
	    @category.destroy

	    redirect_to categories_path
	  end

	  private
	  def category_params
	    params.require(:category).permit(:name)
	  end

end
