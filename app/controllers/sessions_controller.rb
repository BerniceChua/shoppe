class SessionsController < ApplicationController
	include SessionsHelper

	def viewer
		if session[:id].nil?
		end
	end

	def new
		if logged_in?
			@user = User.find(session[:id])
			redirect_to "/users/#{@user.id}"
		 else
		    	render :"/sessions/new"
		 end
  	end

  	def create
	  @user = User.authenticate(params[:login])

	  if @user
	  	session[:id] = @user.id
	  	if session[:id] == 1
	  		redirect_to "/admin/index"
	  	else
	    		redirect_to "/users/#{@user.id}"
	  	end
	  else
	    @errors = "Username and/or Password INCORRECT"
	    render :"/sessions/new"
	  end
	end

	def destroy
	  session.delete(:id)
	  redirect_to '/'
	end
end
