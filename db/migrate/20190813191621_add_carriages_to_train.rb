class AddCarriagesToTrain < ActiveRecord::Migration[5.2]
  def change
  	add_reference :carriages, :train, foreign_key: true
  end
end
