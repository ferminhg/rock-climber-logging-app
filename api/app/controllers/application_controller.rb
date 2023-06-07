# frozen_string_literal: true

class ApplicationController < ActionController::API
  OK_MESSAGE = 'ok'

  before_action :initialize_infrastructure

  def health_check
    render json: { status: OK_MESSAGE }
  end

  def routes
    routes = SearchAllRoutesQueryHandler.new(@repository).run
    render json: { data: routes }
  end

  def create_route
    handler = CreateRouteHandler.new(@repository, @event_store)
    sanitized_params = ParamsRouteSanitizer.sanitize(params)
    route = handler.run(CreateRouteDTO.from_params(sanitized_params))
    render json: { data: route }
  rescue RouteError => e
    render json: { error: e.message }, status: :bad_request
  end

  private

  def initialize_infrastructure
    # repository = InMemoryRouteRepository.new([]) # to be replaced with a real repository
    db = SQLite3::Database.new('./db/development.sqlite3')
    @repository = SqliteRouteRepository.new(db)
    @event_store = Rails.configuration.event_store
  end
end
