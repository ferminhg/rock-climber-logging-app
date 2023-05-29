class ChangeClimbingTimeToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :route_models, :climbing_time, :integer
  end
end
