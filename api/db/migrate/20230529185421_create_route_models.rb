# frozen_string_literal: true

class CreateRouteModels < ActiveRecord::Migration[7.0]
  def change
    create_table :route_models, id: false do |t|
      t.string :route_id, primary_key: true
      t.string :difficult_level
      t.datetime :climbing_time
      t.string :comments

      t.timestamps
    end
  end
end
