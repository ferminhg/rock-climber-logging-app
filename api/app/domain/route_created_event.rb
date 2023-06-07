# frozen_string_literal: true

class RouteCreatedEvent < RailsEventStore::Event
  def self.from(route)
    new(
      data: {
        id: route.id,
        difficult_level: route.difficult_level,
        climbing_time: route.climbing_time
      }
    )
  end
end
