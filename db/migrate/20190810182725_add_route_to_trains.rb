class AddRouteToTrains < ActiveRecord::Migration[5.2]
  def change  	
    add_reference :trains, :route
  end
end
