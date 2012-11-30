ActiveAdmin.register Payout do
	menu :label => "Appraiser Payouts", :parent => "Compensations"  

	index do
		column :created_at
		column :updated_at
		column :id
		column "Appraisal", :appraisal_id do |payout|
			"#{Appraisal.find(payout.appraisal_id).name}"
		end
		column "Appraiser", :appraiser_id do |payout|
			"#{Appraiser.find(payout.appraiser_id).username}"
		end
		column "Completed On" do |payout|
			"#{display_time(payout.appraisal.completion_time("s"))}" if payout.appraisal.completion_time > 0
		end
		column "Amount Paid" do |payout|
			print_as_currency(payout.amount)
		end
		column :status do |payout|
			"#{getStringForPayoutStatus(payout.status)}"
		end
		default_actions
	end

	filter :created_at
	filter :updated_at
	filter :appraisal_id
	filter :appraiser_id
	filter :amount
	filter :status, :as => :select, :collection => PAYOUT_STATUS.sort_by{|key, value| value}.map {|k,v| [v,k]}

	show do
		attributes_table do
			row	:created_at
			row :updated_at
			row :id
			row :appraisal_id
			row :appraiser_id
			row ("Amount" ){|t| print_as_currency(t.amount)}
			row("Status") {|t| "#{getStringForPayoutStatus(t.status)}" }
		end
	end
end
