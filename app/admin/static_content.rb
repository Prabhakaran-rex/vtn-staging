ActiveAdmin.register_page "Static Content" do
  controller do
    define_method(:index) do
      redirect_to admin_cms_sites_path
    end
  end
end

