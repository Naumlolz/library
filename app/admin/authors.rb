ActiveAdmin.register Author do
  permit_params :full_name

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
      f.input :full_name
    end
    f.actions
  end
end