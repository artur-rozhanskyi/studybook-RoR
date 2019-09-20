class AddDataToTicket < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :name, :string
    add_column :tickets, :middle_name, :string
    add_column :tickets, :last_name, :string
    add_column :tickets, :passport, :string
    add_column :tickets, :arrival, :datetime
    add_column :tickets, :departure, :datetime
  end
end
