class CreateJoinTableTrainsRoutes < ActiveRecord::Migration[5.2]
  def change
    create_join_table :routes, :trains
  end
end
