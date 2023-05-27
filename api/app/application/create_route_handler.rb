# frozen_string_literal: true

class CreateRouteHandler
  def initialize(repository)
    @repository = repository
  end

  def run(difficult_level, climbing_time, comments = '')
    route = Route.from(difficult_level, climbing_time, comments)
    @repository.save(route)
    route
  end
end
