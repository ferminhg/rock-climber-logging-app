# frozen_string_literal: true

require 'faker'

class RouteObjectMother
  def self.create
    random_time = Faker::Time.backward.to_i
    comments = Faker::Lorem.sentence.to_s
    difficult_level = DifficultLevelObjectMother.create
    Route.from(difficult_level.to_s, random_time, comments)
  end

end

class DifficultLevelObjectMother
  def self.create
    random_difficulty = DifficultLevel::LEVELS.sample
    DifficultLevel.from(random_difficulty)
  end
end
