class CreateCarriageTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :carriage_types do |t|
    	t.string :name
    end
  end
end
