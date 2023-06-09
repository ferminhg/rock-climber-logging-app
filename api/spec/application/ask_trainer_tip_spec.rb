# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'AskTrainerTip' do
  context 'when runt with happy path' do
    it 'return a tip' do
      handler = AskTrainerTip.new InMemoryTrainer.create
      tip = handler.run
      expect(tip).to be_a(Tip)
    end
  end
end
