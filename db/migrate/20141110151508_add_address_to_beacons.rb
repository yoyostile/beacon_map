class AddAddressToBeacons < ActiveRecord::Migration
  def change
    add_column :beacons, :address, :string
  end
end
