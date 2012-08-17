class Appraisal < ActiveRecord::Base
  attr_accessible :appraiser_number, :country_of_origin, :damage, :dimensions, :historical_significance, :how_it_was_used, :how_was_it_obtained, :makers_marks, :materials, :name, :number_of_pieces_created, :selected_plan, :status, :value_of_item, :when_it_was_used, :where_it_was_manufactured, :where_was_it_obtained, :year_of_manufacture
	has_many :photos, :dependent => :destroy
end
