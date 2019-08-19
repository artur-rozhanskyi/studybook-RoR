class CreateCarriages < ActiveRecord::Migration[5.2]
  def change
    create_table :carriages do |t|
      t.integer :bottom_places
      t.integer :upper_places
    end
  end
end
