class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.references :train
      t.references :first_station, foreign_key: { to_table: :railway_station }
      t.references :last_station, foreign_key: { to_table: :railway_station }
    end
  end
end
