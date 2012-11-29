ActiveAdmin.register Appraisal do
	index do
		column :id
		column :name
		column "Status", :sortable => :status do |t|
			"#{getStringForActivityValue(t.status)}"
		end
		column :created_at
		column :updated_at
		column :owned_by
		column :assigned_to
		column :assigned_on do |t|
			"#{Time.at(t.assigned_on)}" unless t.assigned_on.nil?
		end
		default_actions
	end

	filter :id
	filter :name
	filter :owned_by
	filter :assigned_to
	filter :created_at
	filter :status, :as => :select, :collection => APPRAISAL_STATUS.sort_by{|key, value| value}.map {|k,v| [v,k]}

  show :title => :name do
    attributes_table do
      row("Name") {appraisal.name}
      row("Status") {|t| "#{getStringForActivityValue(t.status)}"}
      row("Selected Plan") {|t| "#{getStringForAppraisalType(t.selected_plan)}"}
      row("View in Frontend") {|t| link_to "Click here", appraisal_path(t)}
    end

    panel "Additional Information" do
      render "appraisal_info", :locals => {:appraiser_info => appraisal.appraisal_info}
    end
  end
end
