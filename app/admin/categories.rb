ActiveAdmin.register Category do
  actions :index, :show, :new, :create, :update, :edit

  form do |f|
    f.inputs "Category Details" do
      f.input :name
    end
    f.actions
  end

end
