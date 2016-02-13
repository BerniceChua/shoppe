class User < ActiveRecord::Base
	validates :username, :email, :password_hash, :permissions, presence: true
	validates :email, :username, uniqueness: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	has_many :carts

	include BCrypt

	def password
    		@password ||= Password.new(password_hash)
  	end

  	def password=(new_password)
    		@password = Password.create(new_password)
    		self.password_hash = @password
  	end

  	def self.authenticate(user_info)
	    	username = user_info[:username]
	    	password = user_info[:password]
	    	user = User.find_by(username: username)
	    	return user if user && user.password == password
  	end
end
