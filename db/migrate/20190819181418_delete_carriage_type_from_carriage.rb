class DeleteCarriageTypeFromCarriage < ActiveRecord::Migration[5.2]
  def change
    remove_reference :carriages, :carrige_type, foreign_key: true
  end
end
