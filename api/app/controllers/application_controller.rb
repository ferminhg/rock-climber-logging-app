# frozen_string_literal: true

# ApplicationController is the superclass of all controller classes in the application.
# It's a good place to put methods that should be available across multiple controllers.

OK_MESSAGE = 'ok'

class ApplicationController < ActionController::API
  def health_check
    render json: { status: OK_MESSAGE }
  end
end
