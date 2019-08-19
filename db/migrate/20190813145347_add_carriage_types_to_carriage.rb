class AddCarriageTypesToCarriage < ActiveRecord::Migration[5.2]
  def change
    add_reference :carriages, :carriage_type, foreign_key: true
  end
end
