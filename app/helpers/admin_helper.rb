module AdminHelper
    # def http_login
    #     user = 'admin'
    #     pw = 'secret'
    #     request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user,pw)
    # end

    def is_admin?
    	@user.permissions == 'admin'
    end

end

