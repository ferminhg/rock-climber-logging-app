class ApplicationController < ActionController::API
    def healthCheck
        render json: { status: "ok" }
    end
end
