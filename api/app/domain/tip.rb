# frozen_string_literal: true

class Tip
  def self.from(tip)
    new.Tip(tip)
  end

  def to_json(*_args)
    {
      tip: @tip
    }.to_json
  end

  private

  def initialize
    @tip = 'Tip: Use the force'
  end
end
