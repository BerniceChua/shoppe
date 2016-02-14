require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  # include SessionsHelper

  describe 'new action' do

    it 'should load the login page' do
      get :new
      expect(response.status).to eq(200)
      expect(response).to render_template(:new)
    end

  end
end
