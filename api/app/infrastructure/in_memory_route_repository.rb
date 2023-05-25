# frozen_string_literal: true

class InMemoryRouteRepository
  def initialize(routes = [])
    @routes = routes
  end

  def find_all
    @routes
  end

  def reset_state
    @routes = []
  end
end
