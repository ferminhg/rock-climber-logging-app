# frozen_string_literal: true

class DifficultLevel
  LEVELS = %w[V V+ 6a 6a+ 6b 6b+ 6c 6c+ 7a].freeze
  UNKNOWN = 'UNKNOWN'

  def self.from(str)
    level = LEVELS.find { |l| l.downcase == str.downcase }
    level || UNKNOWN
  end

  private_class_method :new
end
