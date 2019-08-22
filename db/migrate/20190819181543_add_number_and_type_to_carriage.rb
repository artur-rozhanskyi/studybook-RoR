class AddNumberAndTypeToCarriage < ActiveRecord::Migration[5.2]
  def change
    add_column :carriages, :type, :string
    add_column :carriages, :side_bottom_places, :integer
    add_column :carriages, :side_upper_places, :integer
    add_column :carriages, :seats, :integer
    add_column :carriages, :number, :integer
  end
end
