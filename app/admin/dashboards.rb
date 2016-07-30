ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1

  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.

  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
  content :title=> "Value This Now" do
    columns do
      column do
        panel "Applications Pending Review" do
          ul do
            Appraiser.order("created_at ASC").where("status = ?",EAUserStatusReview).collect do |user|
              li link_to(user.name, admin_appraiser_path(user))
            end
          end
        end
      end
      column do
        panel "Appraisals by Status" do
          ul do
            Appraisal.group(:status).count.map do |key, value| 
              li "#{getStringForActivityValue(key)} :  #{value}"
            end
          end
        end
      end
      column do
        panel "Recent Appraisals" do
          ul do
            Appraisal.order("created_at DESC").limit(5).collect do |appraisal|
              li link_to(appraisal.title, admin_appraisal_path(appraisal))
            end
          end
        end
      end
    end
    columns do
      column do
        panel "Recent Customers" do
          ul do
            Customer.order("created_at DESC").limit(5).collect do |user|
              li link_to(user.name, admin_customer_path(user))
            end
          end
        end
      end
      column do
        panel "Recent Appraisers" do
          ul do
            Appraiser.order("created_at DESC").limit(5).collect do |user|
              li link_to(user.name, admin_appraiser_path(user))
            end
          end
        end
      end
    end
    columns do
      column do
        panel "Review for Rejection" do
          ul do
            Appraisal.where(:status => EActivityValueReviewRejection).collect do |appraisal|
              li link_to(appraisal.title, admin_appraisal_path(appraisal))
            end
          end
        end
      end
    end
  end
end

ActiveAdmin.register_page "Email Reports" do
  content do
    panel "Email bounces" do
      SendgridToolkit::Bounces.new.retrieve_with_timestamps.each do |e|
        li "#{e["email"]} (#{e["created"]}) - #{e["reason"]}" 
      end
    end

    panel "Invalid emails" do
      SendgridToolkit::InvalidEmails.new.retrieve_with_timestamps.each do |e|
        li "#{e["email"]} (#{e["created"]}) - #{e["reason"]}" 
      end
    end

    panel "Spam Reports" do
      SendgridToolkit::SpamReports.new.retrieve_with_timestamps.each do |e|
        li "#{e["email"]} (#{e["created"]}) - #{e["reason"]}" 
      end
    end
  end  
end

ActiveAdmin.register_page "Orders" do
  menu :label => "Monthly Report 2013", :parent => "Reports"
  content do
      render :partial => "admin/reports/orders", :locals => {year: "2013"} 
  end
end

ActiveAdmin.register_page "Orders2014" do
  menu :label => "Monthly Report 2014", :parent => "Reports"
  content do
      render :partial => "admin/reports/orders", :locals => {year: "2014"} 
  end
end

ActiveAdmin.register_page "Orders2015" do
  menu :label => "Monthly Report 2015", :parent => "Reports"
  content do
      render :partial => "admin/reports/orders", :locals => {year: "2015"} 
  end
end