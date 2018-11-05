class AddPhotoToToys < ActiveRecord::Migration[5.2]
  def change
    add_column :toys, :photo, :string
  end
end
