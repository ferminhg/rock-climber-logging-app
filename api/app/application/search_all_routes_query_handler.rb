# frozen_string_literal: true

class SearchAllRoutesQueryHandler
  def initialize(repository)
    @repository = repository
  end

  def run
    print(@event_store)
    @repository.find_all
  end
end
