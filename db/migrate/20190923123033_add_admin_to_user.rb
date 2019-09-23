class AddAdminToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :booleam, default: false
  end
end
