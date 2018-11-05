class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :date_start
      t.date :date_end
      t.references :user, foreign_key: true
      t.references :toy, foreign_key: true

      t.timestamps
    end

    add_column :toys, :owner_id,  :integer
    add_index :toys, :owner_id
  end
end
