module UsersHelper

	def is_correct_user?
		params[:id] == session[:id]
	end

end
