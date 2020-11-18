class AddCoordsToSuperpowers < ActiveRecord::Migration[6.0]
  def change
    add_column :superpowers, :latitude, :float
    add_column :superpowers, :longitude, :float
  end
end
