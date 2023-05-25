# frozen_string_literal: true

class RouteError < StandardError
  ERR_MSG_INVALID_UUID = 'Invalid UUID'
  ERR_MSG_INVALID_CLIMBING_TIME = 'Invalid climbing time'
end

# Route it's a class to represent a climbing route
class Route
  def self.from(difficult_level, climbing_time, comments = '')
    new(SecureRandom.uuid, difficult_level, climbing_time, comments)
  end

  def to_s
    "Route #{@id} has #{@difficult_level} difficult level, #{@climbing_time} climbing time and #{@comments} comments"
  end

  def to_json
    {
      id: @id,
      difficult_level: @difficult_level,
      climbing_time: @climbing_time,
      comments: @comments
    }.to_json
  end

  private

  def initialize(id, difficult_level, climbing_time, comments = '')
    raise RouteError, RouteError::ERR_MSG_INVALID_UUID unless valid_id?(id)
    raise RouteError, RouteError::ERR_MSG_INVALID_CLIMBING_TIME unless valid_climbing_time?(climbing_time)

    @id = id
    @difficult_level = difficult_level
    @climbing_time = climbing_time
    @comments = comments
  end

  def valid_climbing_time?(climbing_time)
    climbing_time.positive? && climbing_time <= Time.now.to_i
  end

  def valid_id?(id)
    id.match?(/\A[a-f0-9]{8}-[a-f0-9]{4}-4[a-f0-9]{3}-[89ab][a-f0-9]{3}-[a-f0-9]{12}\z/i)
  end
end
