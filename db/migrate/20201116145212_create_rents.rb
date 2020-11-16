class CreateRents < ActiveRecord::Migration[6.0]
  def change
    create_table :rents do |t|
      t.date :date_from
      t.date :date_to
      t.references :superpower, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
