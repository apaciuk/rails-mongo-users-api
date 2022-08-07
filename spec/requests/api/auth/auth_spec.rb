# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::Auth::Auths', type: :request do
  describe 'GET /login' do
    it 'returns http success' do
      get '/api/auth/auth/login'
      expect(response).to have_http_status(:success)
    end
  end
end
