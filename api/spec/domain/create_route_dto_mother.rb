# frozen_string_literal: true

require 'faker'

require_relative '../../app/domain/create_route_dto'
require_relative 'route_object_mother'

class CreateRouteDTOMother
  def self.create
    random_time = Faker::Time.backward.to_i
    comments = Faker::Lorem.sentence.to_s
    difficult_level = DifficultLevelObjectMother.create

    CreateRouteDTO.from(difficult_level, random_time, comments)
  end

  def self.create_from_bad_level
    random_time = Faker::Time.backward.to_i
    comments = Faker::Lorem.sentence.to_s
    difficult_level = 'BAD LEVEL'

    CreateRouteDTO.from(difficult_level, random_time, comments)
  end

  def self.create_from_bad_time
    random_time = Time.now.to_i + 1
    comments = Faker::Lorem.sentence.to_s
    difficult_level = 'BAD LEVEL'

    CreateRouteDTO.from(difficult_level, random_time, comments)
  end
end
