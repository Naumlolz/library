class CreateDeviceInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :device_infos do |t|
      t.string "name"
      t.jsonb "get_available_location_providers"
      t.jsonb "get_power_state"
      t.jsonb "config_params"
      t.timestamps
    end
  end
end
