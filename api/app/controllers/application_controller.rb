OK_MESSAGE = "ok"

class ApplicationController < ActionController::API

    def health_check
        render json: { status: OK_MESSAGE }
    end
end
