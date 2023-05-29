# frozen_string_literal: true

class ApplicationController < ActionController::API
  OK_MESSAGE = 'ok'

  before_action :initialize_repository

  def health_check
    render json: { status: OK_MESSAGE }
  end

  def routes
    routes = SearchAllRoutesQueryHandler.new(@repository).run
    render json: { data: routes }
  end

  def create_route
    handler = CreateRouteHandler.new(@repository)
    route = handler.run(params[:difficult_level], params[:climbing_time].to_i, params[:comments])
    render json: { data: route }
  rescue RouteError => e
    render json: { error: e.message }, status: :bad_request
  end

  private

  def initialize_repository
    # repository = InMemoryRouteRepository.new([]) # to be replaced with a real repository
    db = SQLite3::Database.new('./db/development.sqlite3')
    @repository = SqliteRouteRepository.new(db)
  end
end
