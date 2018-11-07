class AddColumnToToys < ActiveRecord::Migration[5.2]
  def change
    add_column :toys, :photo_cache, :string
  end
end
