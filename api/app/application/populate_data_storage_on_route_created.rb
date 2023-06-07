# frozen_string_literal: true

class PopulateDataStorageOnRouteCreated
  def call(event)
    # here we can do whatever we want with the event
    # example populale data storage for data analysis
    print "PopulateDataStorageOnRouteCreated: #{event}\n"
  end
end
