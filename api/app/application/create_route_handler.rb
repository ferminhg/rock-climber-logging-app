# frozen_string_literal: true

class CreateRouteHandler
  def initialize(repository)
    @repository = repository
  end

  def run(create_route_dto)
    route = Route.from(
      create_route_dto.difficult_level,
      create_route_dto.timestamp,
      create_route_dto.comments
    )
    @repository.save(route)
    route
  end
end
