class DeleteCarriageTypeFromCarriage < ActiveRecord::Migration[5.2]
  def change
    remove_reference :carriages, :carriage_type, foreign_key: true
    drop_table :carriage_types
  end
end
