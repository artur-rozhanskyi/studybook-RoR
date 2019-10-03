class AddIndexesToRoutesTrain < ActiveRecord::Migration[5.2]
  def change
    add_index :routes_trains, :train_id
    add_index :routes_trains, :route_id
    add_index :routes_trains, [:route_id, :train_id]
  end
end
