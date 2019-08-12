class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.integer :train_id
      t.integer :first_station_id, foreign_key: { to_table: :railway_station }
      t.integer :last_station_id, foreign_key: { to_table: :railway_station }
    end
  end
end
