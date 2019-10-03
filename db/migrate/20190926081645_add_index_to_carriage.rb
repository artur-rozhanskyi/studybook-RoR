class AddIndexToCarriage < ActiveRecord::Migration[5.2]
  def change
    add_index :carriages, [:id, :type]
  end
end
