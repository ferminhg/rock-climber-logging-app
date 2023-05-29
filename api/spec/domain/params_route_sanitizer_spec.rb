# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ParamsRouteSanitizer' do
  context 'when params are valid' do
    it 'return params' do
      params = { difficult_level: 'V', climbing_time: '10', comments: 'test' }
      sanitized_params = ParamsRouteSanitizer.sanitize(params)
      params[:climbing_time] = params[:climbing_time].to_i
      expect(sanitized_params).to eq(params)
    end

    it 'return params' do
      params = { difficult_level: ' V+ ', climbing_time: '10 ' }
      expected_params = { difficult_level: 'V+', climbing_time: 10, comments: '' }
      sanitized_params = ParamsRouteSanitizer.sanitize(params)
      expect(sanitized_params).to eq(expected_params)
    end

    it 'return params' do
      params = { difficult_level: '///???\V+ ', climbing_time: 10, comments: '' }
      expected_params = { difficult_level: '///???\V+', climbing_time: 10, comments: '' }
      sanitized_params = ParamsRouteSanitizer.sanitize(params)
      expect(sanitized_params).to eq(expected_params)
    end
  end
end
