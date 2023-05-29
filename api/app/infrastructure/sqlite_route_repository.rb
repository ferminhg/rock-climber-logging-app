# frozen_string_literal: true

class SqliteRouteRepository
  def initialize(db)
    @db = db
  end

  SQL_FIND_ALL = 'SELECT route_id, difficult_level, climbing_time, comments FROM route_models ORDER by created_at'

  def find_all
    @db.execute(SQL_FIND_ALL).map do |row|
      Route.from_model(row)
    end
  end

  SQL_INSERT_ROUTE = <<~SQL.squish
    INSERT INTO route_models (route_id, difficult_level, climbing_time, comments, created_at, updated_at)
    VALUES (?, ?, ?, ?, ?, ?)
  SQL

  def save(route)
    @db.execute(SQL_INSERT_ROUTE, route.id.to_s, route.difficult_level.to_s, route.climbing_time, route.comments,
                Time.now.to_i, Time.now.to_i)
  end
end
