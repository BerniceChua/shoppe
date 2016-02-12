module AdminHelper
    # def http_login
    #     user = 'admin'
    #     pw = 'secret'
    #     request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user,pw)
    # end

    def is_admin?
    	session[:id] == 1
    end

    def render_to_authorized
    	if is_admin?
    		@products = Product.all
    	else
    		render '/admin/unauthorized'
    	end
    end

end

