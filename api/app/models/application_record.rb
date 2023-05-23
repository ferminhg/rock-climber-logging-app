class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  def healthcheck
    render json: { status: "ok" }
  end
end
