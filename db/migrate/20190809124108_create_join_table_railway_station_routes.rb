class CreateJoinTableRailwayStationRoutes < ActiveRecord::Migration[5.2]
  def change
    create_join_table :routes, :railway_stations
  end
end
