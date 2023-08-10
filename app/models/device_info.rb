# == Schema Information
#
# Table name: device_infos
#
#  id                               :bigint           not null, primary key
#  config_params                    :jsonb
#  get_available_location_providers :jsonb
#  get_power_state                  :jsonb
#  name                             :string
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#
class DeviceInfo < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["config_params", "created_at", "get_available_location_providers", "get_power_state", "id", "name", "updated_at"]
  end
end
