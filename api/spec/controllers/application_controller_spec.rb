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
      expect(json_response['data']).to be_an_instance_of(Array)
    end
  end

  describe 'GET #ask_tip' do
    before do
      skip 'Skipping the test because it is too slow and not needed'
      get :ask_trainer_tip
    end

    it 'returns HTTP status 200' do
      skip 'Skipping the test because it is too slow and not needed'
      expect(response).to have_http_status(200)
    end

    it 'returns JSON with data' do
      skip 'Skipping the test because it is too slow and not needed'
      json_response = JSON.parse(response.body)
      expect(json_response['data']).to have_key('tip')
    end

  end
end
