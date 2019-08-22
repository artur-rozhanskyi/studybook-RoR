class AddSortToTrain < ActiveRecord::Migration[5.2]
  def change
    add_column :trains, :sort, :boolean
  end
end
