class AppraisalInfo

	include ActiveModel::Validations
	include ActiveModel::Conversion
	extend ActiveModel::Naming

	attr_accessor :additional_ea, :dimensions, :materials, :country_of_origin, :makers_marks, 
                  :damage, :year_of_manufacture, :where_was_it_obtained, :how_was_it_obtained,
                  :value_of_item, :historical_significance, 
                  :number_of_pieces_created, :where_it_was_manufactured, :when_it_was_used, 
                  :how_it_was_used, :inscriptions, :item_history, :appraiser_comments,
                  :replacement_cost_min, :replacement_cost_max, :fair_market_value_min, :fair_market_value_max

	def initialize(attributes = {})
		attributes.each do |name, value|
			send("#{name}=", value)
		end
	end

	def sanitize
		sanitize_currency
	end

	private
	# Remove all currency symbols and commas from input
	def sanitize_currency
		%w[replacement_cost_min replacement_cost_max fair_market_value_min fair_market_value_max].each {|name| send("#{name}=", (send("#{name}").gsub(/,|\$/,"")))}
	end
end