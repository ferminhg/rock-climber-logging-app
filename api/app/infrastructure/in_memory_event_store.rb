# frozen_string_literal: true

class InMemoryEventStore
  def initialize
    @event_store = []
  end

  def publish(event, stream_name:)
    @event_store << { event:, stream_name: }
  end

  def event_store
    @event_store
  end
end
