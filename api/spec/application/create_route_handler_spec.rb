# frozen_string_literal: true

require 'rails_helper'
require_relative '../../app/domain/route_error'

RSpec.describe 'CreateRouteHandler' do
  context 'when run with happy path' do
    it 'then is saved on repository' do
      repository = InMemoryRouteRepository.new
      handler = CreateRouteHandler.new(repository)
      route = handler.run('V', Time.now.to_i, 'comments')
      expect(route).to be_a(Route)
      expect(repository.find_all).to eq([route])
      expect { JSON.parse(route.to_json) }.not_to raise_error
    end

    it 'raises error when difficult level is invalid' do
      repository = InMemoryRouteRepository.new
      handler = CreateRouteHandler.new(repository)
      expect do
        handler.run(nil, Time.now.to_i, 'comments')
      end.to raise_error(RouteError, RouteError::ERR_MSG_INVALID_DIFFICULT_LEVEL)
    end

    it 'raises error when timestamp is invalid' do
      repository = InMemoryRouteRepository.new
      handler = CreateRouteHandler.new(repository)
      expect { handler.run('V', nil) }.to raise_error(RouteError)
    end
  end
end
