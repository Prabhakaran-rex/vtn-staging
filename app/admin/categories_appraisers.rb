 ActiveAdmin.register_page "Categories vs Appraisers" do
   menu :label => "Categories vs Appraisers", :parent => "Reports"
    content do
      render :partial => "admin/reports/categories_appraisers"
    end
 end

 ActiveAdmin.register_page "Appraisers vs Categories" do
   menu :label => "Appraisers vs Categories", :parent => "Reports"
    content do
      render :partial => "admin/reports/appraisers_categories"
    end
 end

 ActiveAdmin.register_page "Orphan Categories" do
   menu :label => "Orphan Categories", :parent => "Reports"
    content do
      render :partial => "admin/reports/orphan_categories"
    end
 end

 ActiveAdmin.register_page "Export Static Content" do
   menu :label => "Export Static Content", :parent => "Reports"
    content do
      render :partial => "admin/reports/static_content"
    end
 end
