# frozen_string_literal: true

# require_relative '../../app/application/populate_data_storage_on_route_created'

Rails.configuration.to_prepare do
  Rails.configuration.event_store = event_store = RailsEventStore::Client.new
  event_store.subscribe(PopulateDataStorageOnRouteCreated.new, to: [RouteCreatedEvent])
end
