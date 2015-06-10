class AddManyColumnToStations < ActiveRecord::Migration
  def change
    add_column :stations, :address, :string
    add_column :stations, :latitude, :float
    add_column :stations, :longitude, :float
  end
end
