# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

RouteModel.create(route_id: 'abc02ded-d972-4e3c-9ec1-a7ae9a33c795', difficult_level: 'V',
                  climbing_time: 1_653_851_789, comments: 'This is a comment')
RouteModel.create(route_id: '76fa6406-5b05-4903-a17d-2386a0214738', difficult_level: '6a',
                  climbing_time: 1_653_938_189, comments: 'This is a comment')
RouteModel.create(route_id: '1ec22a65-3ce4-4e58-82c0-5c8576b233fc', difficult_level: '6a+',
                  climbing_time: 1_654_024_589, comments: 'This is a comment')
RouteModel.create(route_id: 'b3c36770-eeb2-4908-b931-6f11ebf3b1ce', difficult_level: 'V',
                  climbing_time: 1_654_024_589, comments: 'This is a comment')
