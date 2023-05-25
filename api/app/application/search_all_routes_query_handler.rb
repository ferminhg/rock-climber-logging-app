# frozen_string_literal: true

class SearchAllRoutesQueryHandler
  def initialize(repository)
    @repository = repository
  end

  def run
    @repository.find_all
  end
end
