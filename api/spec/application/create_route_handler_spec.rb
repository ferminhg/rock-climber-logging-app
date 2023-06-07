# frozen_string_literal: true
require 'rails_helper'
require_relative '../../app/domain/route_error'
require_relative '../../spec/domain/create_route_dto_mother'

RSpec.describe 'CreateRouteHandler' do
  before do
    @repository = InMemoryRouteRepository.new
    @event_store = InMemoryEventStore.new
  end

  context 'when run with happy path' do
    after do
      @repository.reset_state
    end
    let(:handler) { CreateRouteHandler.new(@repository, @event_store) }

    it 'then is saved on repository and create event' do
      dto = CreateRouteDTOMother.create
      route = handler.run(dto)
      expect(route).to be_a(Route)
      expect(@repository.find_all).to eq([route])
      expect { JSON.parse(route.to_json) }.not_to raise_error

      stored_event = @event_store.event_store[0]

      expect(stored_event[:event]).to be_a(RouteCreatedEvent)
      expect(stored_event[:stream_name]).to eq("Route$#{route.id}")
    end

    it 'raises error when difficult level is invalid' do
      dto = CreateRouteDTOMother.create_from_bad_level
      expect do
        handler.run(dto)
      end.to raise_error(RouteError, RouteError::ERR_MSG_INVALID_DIFFICULT_LEVEL)
    end

    it 'raises error when timestamp is invalid' do
      expect { handler.run(CreateRouteDTOMother.create_from_bad_time) }.to raise_error(RouteError)
    end
  end
end
