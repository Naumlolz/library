ActiveAdmin.register Book do
  permit_params :title, :description, :avatar

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
      f.input :title
      f.input :description

      f.input :avatar, :as => :file
    end
    f.actions
  end
end
