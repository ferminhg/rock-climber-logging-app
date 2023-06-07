# frozen_string_literal: true

class CreateRouteDTO
  attr_reader :difficult_level, :timestamp, :comments

  def self.from(difficult_level, timestamp, comments = '')
    new(difficult_level, timestamp, comments)
  end

  def self.from_params(params)
    new(params[:difficult_level], params[:timestamp], params[:comments])
  end

  private

  def initialize(difficult_level, timestamp, comments)
    @difficult_level = difficult_level
    @timestamp = timestamp
    @comments = comments
  end
end
