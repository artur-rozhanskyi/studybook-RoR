class AddCurrentStationToTrains < ActiveRecord::Migration[5.2]
  def change
    add_reference :trains, :current_station, foreign_key: { to_table: :railway_station }
  end
end
