class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :type
      t.decimal :price
      t.string :city
      t.string :comune

      t.timestamps null: false
    end
  end
end
