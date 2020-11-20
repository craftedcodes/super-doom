class AddPhotoToSuperpowers < ActiveRecord::Migration[6.0]
  def change
    add_column :superpowers, :pic, :string
  end
end
