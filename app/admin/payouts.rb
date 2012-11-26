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
		column "Amount Paid" do |payout|
			print_as_currency(payout.amount)
		end
		column :status do |payout|
			"#{getStringForPayoutStatus(payout.status)}"
		end
		default_actions
	end

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
