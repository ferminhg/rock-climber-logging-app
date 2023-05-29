# frozen_string_literal: true

class ApplicationController < ActionController::API
  OK_MESSAGE = 'ok'


  def health_check
    render json: { status: OK_MESSAGE }
  end

  def routes
    # repository = InMemoryRouteRepository.new([]) # to be replaced with a real repository
    db = SQLite3::Database.new('./db/development.sqlite3')
    repository = SqliteRouteRepository.new(db)
    routes = SearchAllRoutesQueryHandler.new(repository).run

    render json: { data: routes }
  end

  def create_route
    # repository = InMemoryRouteRepository.new([]) # to be replaced with a real repository
    db = SQLite3::Database.new('./db/development.sqlite3')
    repository = SqliteRouteRepository.new(db) # to be replaced with a real repository
    handler = CreateRouteHandler.new(repository)
    route = handler.run(params[:difficult_level], params[:climbing_time].to_i, params[:comments])

    render json: { data: route }
  rescue RouteError => e
    render json: { error: e.message }, status: :bad_request
  end
end
