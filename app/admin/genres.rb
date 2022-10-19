ActiveAdmin.register Genre do
  permit_params :name

  member_action :update, method: :patch do
    book.update(genre_id: nil)
    redirect_to resource_path, notice: "Deleted!"
  end

  action_item :import_demo, only: :show do
    link_to 'Import Demo', '#'
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs "Genre" do
      f.input :name
    end
    f.actions
  end
end