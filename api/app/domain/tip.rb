# frozen_string_literal: true

class Tip
  def self.from(tip)
    new(tip)
  end

  def to_json(*_args)
    {
      tip: @tip
    }.to_json
  end

  private

  def initialize(tip = 'Use the force 🫵')
    @tip = tip
  end
end
