class AddStatusToRents < ActiveRecord::Migration[6.0]
  def change
    add_column :rents, :status, :boolean, default: false
  end
end
