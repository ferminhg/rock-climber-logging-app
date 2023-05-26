# frozen_string_literal: true

class ApplicationController < ActionController::API
  OK_MESSAGE = 'ok'

  def health_check
    render json: { status: OK_MESSAGE }
  end

  def routes
    repository = InMemoryRouteRepository.new([]) # to be replaced with a real repository
    routes = SearchAllRoutesQueryHandler.new(repository).run

    render json: { data: routes }
  end
end
