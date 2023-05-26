# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe 'GET #health_check' do
    before do
      get :health_check
    end

    it 'returns HTTP status 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns JSON with status OK_MESSAGE' do
      json_response = JSON.parse(response.body)
      expect(json_response['status']).to eq(ApplicationController::OK_MESSAGE)
    end
  end

  describe 'GET #routes' do
    before do
      get :routes
    end

    it 'returns HTTP status 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns JSON with data' do
      json_response = JSON.parse(response.body)
      expect(json_response['data']).to eq([])
    end
  end
end
