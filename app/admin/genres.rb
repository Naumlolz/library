ActiveAdmin.register Genre do
  permit_params :name, :avatar

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
      f.input :name

      f.input :avatar, :as => :file
    end
    f.actions
  end
end