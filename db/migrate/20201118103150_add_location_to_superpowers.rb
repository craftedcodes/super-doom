class AddLocationToSuperpowers < ActiveRecord::Migration[6.0]
  def change
    add_column :superpowers, :location, :string
  end
end
