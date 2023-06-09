# frozen_string_literal: true

class OpenIATrainer
  FUN_ROLES = ['Yoda', 'Master Migalli', 'Ninja Turtle Rat', 'Dumbledore'].freeze
  PROMT = 'I am a rock climbing coach and I need tips to improve my climbing and stay motivated.' \
          ' You will act as a fun role:'

  def initialize
    @client = OpenAI::Client.new
  end

  def ask
    role = OpenIATrainer::FUN_ROLES.sample
    initial_text = "#{OpenIATrainer::PROMT} #{role}."

    response = @client.completions(
      parameters: {
        model: 'text-davinci-003',
        prompt: initial_text,
        temperature: 0.6,
        max_tokens: 50,
        top_p: 1,
        frequency_penalty: 0.0,
        presence_penalty: 0.0
      }
    )

    raise 'No response from OpenAI' if response['choices'].empty? || response['choices'][0]['text'].empty?

    tip = response['choices'][0]['text']
    tip.remove!("\n")
    tip.remove!('1. ')

    "#{tip} - #{role}"
  end
end
