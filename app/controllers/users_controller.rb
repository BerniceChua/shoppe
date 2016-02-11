class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

	def new
	end

	def create
		puts params
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "#{@user.username} saved! ^_^"
			redirect_to "/users/#{@user.id}"
		else
			@errors = @user.errors
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to @user
		else
			@errors = @user.errors
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy

		redirect_to users_path
	end

	private
	def user_params
		params.require(:user).permit(:username, :password, :email, :permissions)
	end
end
