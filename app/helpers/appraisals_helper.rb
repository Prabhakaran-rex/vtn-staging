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
end


