# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Route domain model' do
  context 'when create a Route object' do
    it 'return a Route' do
      expect(Route.from('V', 1)).to be_a(Route)
      expect(Route.from('V', Time.now.to_i)).to be_a(Route)
    end

    it 'raise an exception if climbing_time is the future' do
      expect { Route.from('', Time.now.to_i + 10) }.to raise_error(RouteError::ERR_MSG_INVALID_CLIMBING_TIME)
    end
  end
end
