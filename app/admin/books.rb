ActiveAdmin.register Book do
  permit_params :title, :description, :avatar, :genre_id, :author_id

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :genre_id, as: :select, collection: Genre.all.pluck(
        :name, :id
      )
      f.input :author_id, as: :select, collection: Author.all.pluck(
        :full_name, :id
      )

      f.input :avatar, :as => :file
    end
    f.actions
  end
end
