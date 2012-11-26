ActiveAdmin.register Compensation do
	hItems = {"Light Restricted Use Appraisal" => EAAppraisalTypeShortRestricted,
				"Full Restricted Use Appraisal" => EAAppraisalTypeLongRestricted,
				"Light Summary Appraisal" => EAAppraisalTypeShortForSelling,
				"Full Summary Appraisal" => EAAppraisalTypeLongForSelling}

	menu :label => "Compensation Rules", :parent => "Compensations"
	index do
		column :id
		column :appraisal_plan do |compensation|
			getStringForAppraisalType(compensation.appraisal_plan)
		end
		column "Amount Paid" do |compensation|
			print_as_currency(compensation.amount)
		end
		column "Range (hours)" do |compensation|
			"#{compensation.min_range} to #{compensation.max_range}"
		end

		default_actions
	end

	filter :appraisal_plan, :as => :select, :collection => hItems
	filter :amount
	filter :min_range
	filter :max_range


	form do |f|
		f.inputs "New Compensation" do
			
				f.input :appraisal_plan, :as => :select, :collection => hItems
				f.input :amount, :hint => "Enter the amount in dollars to be paid to the appraiser"
				f.input :min_range, :hint => "In hours"
				f.input :max_range, :hint => "In hours"
		end
		f.buttons
	end
	
	show do
		attributes_table do
			row("Amount Paid") {compensation.amount}
			row("Appraisal Plan") {getStringForAppraisalType(compensation.appraisal_plan)}
			row("Min Range") {compensation.min_range}
			row("Max Range") {compensation.max_range}
		end
	end
end

ActiveAdmin.register_page "Compensation Table" do
	menu :label => "Compensation Table", :parent => "Compensations"
    content do
      render :partial => "admin/compensations/compensation_table"
    end
  end