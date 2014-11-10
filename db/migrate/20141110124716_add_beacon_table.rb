class AddBeaconTable < ActiveRecord::Migration
  def change
    create_table :beacons do |t|
      t.datetime :date
      t.string :uuid
      t.string :local_name
      t.string :tx_power_level
      t.string :rssi
      t.string :manufacturer_data
      t.string :lat
      t.string :lng
      t.timestamps
    end
  end
end
