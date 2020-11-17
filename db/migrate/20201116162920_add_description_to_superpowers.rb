class AddDescriptionToSuperpowers < ActiveRecord::Migration[6.0]
  def change
    add_column :superpowers, :description, :text
  end
end
