class Appraisal < ActiveRecord::Base
	attr_accessible :appraiser_number, :country_of_origin, :damage, :dimensions, :historical_significance, :how_it_was_used, :how_was_it_obtained, :makers_marks, :materials, :name, :number_of_pieces_created, :selected_plan, :status, :value_of_item, :when_it_was_used, :where_it_was_manufactured, :where_was_it_obtained, :year_of_manufacture
	has_many :photos, :dependent => :destroy
	belongs_to :assigned_to, :class_name => 'User' , :foreign_key => "assigned_to"
	belongs_to :owned_by,    :class_name => 'User' , :foreign_key => "created_by"

	 accepts_nested_attributes_for :photos, :allow_destroy => true

	  validates_presence_of :created_by
end
