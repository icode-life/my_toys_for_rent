class CreateToys < ActiveRecord::Migration[5.2]
  def change
    create_table :toys do |t|
      t.string :name
      t.text :description
      t.string :category
      t.integer :price

      t.timestamps
    end
  end
end
