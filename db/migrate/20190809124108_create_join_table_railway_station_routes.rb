class CreateJoinTableRailwayStationRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :railway_stations_routes do |t|
      t.references :route, null: false
      t.references :railway_station, null: false
    end

    # Add an unique index for better join speed!
    add_index(:railway_stations_routes, [:route_id, :railway_station_id], :unique => true, :name => "index_railway_stations_routes")
  end
end
