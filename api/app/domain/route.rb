# frozen_string_literal: true

require_relative 'difficult_level'
require_relative 'route_error'

# Route it's a class to represent a climbing route
class Route
  attr_reader :id, :difficult_level, :climbing_time, :comments

  def self.from(difficult_level, climbing_time, comments = '')
    new(SecureRandom.uuid, difficult_level, climbing_time, comments)
  end

  def self.from_model(model)
    raise RouteError, RouteError::ERR_MSG_INVALID_MODEL unless model.is_a?(Array) && model.length == 4

    new(model[0], model[1], model[2], model[3])
  end

  def to_s
    "Route #{@id} has #{@difficult_level} difficult level, #{@climbing_time} climbing time and #{@comments} comments"
  end

  def to_json(*_args)
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

    @difficult_level = DifficultLevel.from(difficult_level)
    @id = id
    @climbing_time = climbing_time
    @comments = comments
  end

  def valid_climbing_time?(climbing_time)
    return false if climbing_time.nil?

    climbing_time.positive? && climbing_time <= Time.now.to_i
  end

  def valid_id?(id)
    id.match?(/\A[a-f0-9]{8}-[a-f0-9]{4}-4[a-f0-9]{3}-[89ab][a-f0-9]{3}-[a-f0-9]{12}\z/i)
  end
end
