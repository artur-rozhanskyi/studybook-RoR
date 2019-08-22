class CreateJoinTableRailwayStationRoutes < ActiveRecord::Migration[5.2]
  def change
    create_join_table :routes, :railway_stations, column_options: {null: true} do |t|
      t.index :route_id
      t.index :railway_station_id
    end
  end
end
