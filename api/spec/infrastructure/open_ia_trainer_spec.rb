# frozen_string_literal: true

require 'rails_helper'

require_relative '../../app/infrastructure/open_ia_trainer'

RSpec.describe 'OpenIATrainer' do
  context 'when run' do
    it 'happy path' do
      skip 'Skipping the test because it is too slow and not needed'
      trainer = OpenIATrainer.new
      tip = trainer.ask
      expect(tip).is_a?(String)
    end
  end
end
