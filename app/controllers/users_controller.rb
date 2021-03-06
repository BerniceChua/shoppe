class UsersController < ApplicationController

include UsersHelper

	def show
		@user = User.find(params[:id])
		@user_carts = @user.carts.order(updated_at: :desc)
	end

	def new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			login(@user)
			# flash[:success] = "#{@user.username} saved! ^_^"
			Cart.create(user_id: @user.id)
			redirect_to "/users/#{@user.id}"

		else
			@errors = @user.errors
			render 'new'
		end
	end

	def edit
		user_being_viewed = User.find(params[:id])
		if current_user == user_being_viewed
			@user = user_being_viewed
		else
			redirect_to "/sessions/new"
		end
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
