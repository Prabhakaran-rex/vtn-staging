
 ActiveAdmin.register_page "Static Content" do
   controller do
     define_method(:index) do
       redirect_to cms_admin_sites_path
     end
   end
 end

 ActiveAdmin.register_page "Blog" do
   controller do
     define_method(:index) do
       redirect_to '/cms/refinery'
     end
   end
 end
