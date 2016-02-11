module SessionsHelper
	def login(user)
	    session[:id] = user.id
	 end

	 def logged_in?
	    session[:id] != nil
	 end

	 def current_user
	    @user ||= User.find(session[:id]) if session[:id]
	 end

	# clears just that session id
	 def logout!
	    session[:id] = nil
	    redirect '/'
	end
end
