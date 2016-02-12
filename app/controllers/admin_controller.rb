class AdminController < ApplicationController

  def index
  	render_to_authorized
  end

end
