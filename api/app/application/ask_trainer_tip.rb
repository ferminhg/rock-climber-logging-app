# frozen_string_literal: true

class AskTrainerTip
  def initialize(trainer)
    @trainer = trainer
  end

  def run
    answer = @trainer.ask
    Tip.from(answer)
  end
end
