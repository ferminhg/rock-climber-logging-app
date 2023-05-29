# frozen_string_literal: true

class SqliteRouteRepository
  def initialize(db)
    @db = db
  end

  SQL_FIND_ALL = 'SELECT route_id, difficult_level, climbing_time, comments FROM route_models ORDER by created_at'

  def find_all
    @db.execute(SQL_FIND_ALL).map do |row|
      printf("row: #{row}")
      Route.from_model(row)
    end
  end
end
