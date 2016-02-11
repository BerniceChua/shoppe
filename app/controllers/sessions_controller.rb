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
	    redirect_to "/users/#{@user.id}"
	  else
	  	puts "THIS WAS NOT RIGHT AT ALL!!!!!!!!!!!"
	    @errors = "Username and/or Password INCORRECT"
	    render :"/sessions/new"
	  end
	end

	def destroy
	  session.delete(:id)
	  redirect_to '/'
	end
end
