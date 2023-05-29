# frozen_string_literal: true

class CreateRouteHandler
  def initialize(repository)
    @repository = repository
  end

  def run(params)
    difficult_level = params[:difficult_level]
    climbing_time = params[:climbing_time]
    comments = params[:comments]
    route = Route.from(difficult_level, climbing_time, comments)
    @repository.save(route)
    route
  end
end
