# frozen_string_literal: true

require_relative 'route_error'

class DifficultLevel
  LEVELS = %w[V V+ 6a 6a+ 6b 6b+ 6c 6c+ 7a UNKNOWN].freeze
  UNKNOWN = 'UNKNOWN'

  def self.from(str)
    raise RouteError, RouteError::ERR_MSG_INVALID_DIFFICULT_LEVEL if str.nil?
    raise RouteError, RouteError::ERR_MSG_INVALID_DIFFICULT_LEVEL unless LEVELS.include?(str)

    level = LEVELS.find { |l| l.downcase == str.downcase }
    level || UNKNOWN
  end

  private_class_method :new
end
