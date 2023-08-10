ActiveAdmin.register DeviceInfo do
  permit_params :name, :config_params, :get_available_location_providers, :get_power_state
  json_editor

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
      f.input :name
      f.input :config_params, as: :jsonb
      f.input :get_available_location_providers, as: :jsonb
      f.input :get_power_state, as: :jsonb
    end
    f.actions
  end
end