class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name
      t.decimal :oct93
      t.decimal :oct94
      t.decimal :oct95
      t.string :city
      t.string :comune

      t.timestamps null: false
    end
  end
end
