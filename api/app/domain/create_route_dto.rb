# frozen_string_literal: true

class CreateRouteDTO
  attr_reader :difficult_level, :climbing_time, :comments

  def self.from(difficult_level, climbing_time, comments = '')
    new(difficult_level, climbing_time, comments)
  end

  def self.from_params(params)
    new(params[:difficult_level], params[:climbing_time], params[:comments])
  end

  private

  def initialize(difficult_level, climbing_time, comments)
    @difficult_level = difficult_level
    @timestamp = climbing_time
    @comments = comments
  end
end
