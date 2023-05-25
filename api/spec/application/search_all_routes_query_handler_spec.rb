# frozen_string_literal: true

require 'rails_helper'
require_relative '../../spec/domain/route_object_mother'

RSpec.describe 'SearchAllRoutesQueryHandler' do
  before do
    @repository = InMemoryRouteRepository.new
  end

  after do
    @repository.reset_state
  end

  context 'when handler runs' do
    it 'return Routes Array' do
      handler = SearchAllRoutesQueryHandler.new(@repository)
      routes = handler.run
      expect(routes).to be_an(Array)
    end

    it 'return Routes Array with 1 element' do
      route = RouteObjectMother.create
      @repository = InMemoryRouteRepository.new([route])
      handler = SearchAllRoutesQueryHandler.new(@repository)
      routes = handler.run
      expect(routes.size).to eq(1)
      expect(routes[0]).to eq(route)
    end
  end
end
