ActiveAdmin::Dashboards.build do

  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.
  
  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
  section "Applications Pending Review", :priority => 9 do
    ul do
      User.order("created_at ASC").where("status = ?",EAUserStatusReview).collect do |user|
        li link_to(user.name, admin_user_path(user))
      end     
    end    
  end

  section "Recent Appraisals" do
    ul do
      Appraisal.order("created_at DESC").limit(5).collect do |appraisal|
        li link_to(appraisal.name, admin_appraisal_path(appraisal))
      end
    end
  end

  section "Recent Users" do
    ul do
      User.order("created_at DESC").limit(5).collect do |user|
        li link_to(user.name, admin_user_path(user))
      end
    end
  end

  section "Appraisals by Status" do
    ul do
      Appraisal.group(:status).count.map do |key, value| 
        li "#{getStringForActivityValue(key)} :  #{value}"
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
  
  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end
  
  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", 
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.
  
  # == Conditionally Display
  # Provide a method name or Proc object to conditionally render a section at run time.
  #
  # section "Membership Summary", :if => :memberships_enabled?
  # section "Membership Summary", :if => Proc.new { current_admin_user.account.memberships.any? }

end
