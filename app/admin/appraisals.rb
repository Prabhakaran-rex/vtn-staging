ActiveAdmin.register Appraisal do
	index do
		column :id
		column :title
		column "Status", :sortable => :status do |t|
			"#{getStringForActivityValue(t.status)}"
		end
		column :created_at
		column :updated_at
		column :owned_by, :sortable => "owned_bies_appraisals.name"
		column :assigned_to, :sortable => "users.name"
		column :assigned_on, :sortable => :assigned_on do |t|
			"#{Time.at(t.assigned_on)}" unless t.assigned_on.nil?
		end
		column "Completed On" do |t|
			"#{display_time(t.completion_time("s"))}" if t.completion_time > 0
		end
		default_actions
	end

	filter :id
	filter :title
	filter :owned_by
	filter :assigned_to
	filter :created_at
	filter :status, :as => :select, :collection => APPRAISAL_STATUS.sort_by{|key, value| value}.map {|k,v| [v,k]}

  show :title => :title do
    attributes_table do
      row("Title") {appraisal.title}
      row("Description") {appraisal.name}
      row("Status") {|t| "#{getStringForActivityValue(t.status)}"}
      row("Selected Plan") {|t| "#{getStringForAppraisalType(t.selected_plan)}"}
      row("View in Frontend") {|t| link_to "Click here", appraisal_path(t)}
    end

    panel "Additional Information" do
      render "appraisal_info", :locals => {:appraiser_info => appraisal.appraisal_info}
    end
  end

  controller do
  	def scoped_collection
  		Appraisal.includes(:assigned_to, :owned_by)
  	end
  end
end
