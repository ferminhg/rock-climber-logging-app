# frozen_string_literal: true

class CreateRouteHandler
  def initialize(repository, event_store)
    @repository = repository
    @event_store = event_store
  end

  def run(create_route_dto)
    route = Route.from(
      create_route_dto.difficult_level,
      create_route_dto.climbing_time,
      create_route_dto.comments
    )
    @repository.save(route)
    @event_store.publish(RouteCreatedEvent.from(route), stream_name: "Route$#{route.id}")
    route
  end
end
