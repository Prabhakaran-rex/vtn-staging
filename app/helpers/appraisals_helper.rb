module AppraisalsHelper

	def print_replacement_cost(appraisal)
		unless (appraisal.appraisal_info.replacement_cost_min.blank? || appraisal.appraisal_info.replacement_cost_max.blank?)
			"#{print_as_currency(appraisal.appraisal_info.replacement_cost_min)} to #{print_as_currency(appraisal.appraisal_info.replacement_cost_max)} " 
		end
	end

	def print_fair_market_value(appraisal)
		unless (appraisal.appraisal_info.fair_market_value_min.blank? || appraisal.appraisal_info.fair_market_value_max.blank?)
			"#{print_as_currency(appraisal.appraisal_info.fair_market_value_min)} to #{print_as_currency(appraisal.appraisal_info.fair_market_value_max)}"
		end
	end

	def print_amount_paid(appraisal)
		if appraisal.status == EActivityValueFinalized && !appraisal.payout.nil?
			"#{print_as_currency(appraisal.payout.amount)}"
		end
	end

	def print_payout_status(appraisal)
		if appraisal.status == EActivityValueFinalized && !appraisal.payout.nil?
			"#{getStringForPayoutStatus(appraisal.payout.status)}"
		end
	end

	def get_linked_thumbnail(appraisal)
		link_to image_tag(appraisal.photos.first.asset.url(:thumb), :class => "tagThumb"), appraisal, :title => h(appraisal.title) unless appraisal.photos.count == 0
	end
end


