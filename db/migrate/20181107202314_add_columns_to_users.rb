class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :address, :string
    add_column :users, :f_name, :string
    add_column :users, :l_name, :string
    add_column :users, :photo, :string
  end
end
