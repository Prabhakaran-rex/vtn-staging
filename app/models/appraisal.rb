class Appraisal < ActiveRecord::Base
  has_many :appraisal_activities
  has_many :photos, :dependent => :destroy

  has_many :appraisal_datums , :dependent => :destroy  , :class_name => "AppraisalDatum"
  has_one :payment

  belongs_to :assigned_to, :class_name => 'User' , :foreign_key => "assigned_to"
  belongs_to :owned_by,    :class_name => 'User' , :foreign_key => "created_by"

  accepts_nested_attributes_for :photos, :allow_destroy => true
  accepts_nested_attributes_for :appraisal_datums, :allow_destroy => true

  validates_presence_of :created_by

  serialize :appraisal_info, AppraisalInfo

  attr_accessible :selected_plan, :name, :photos_attributes, :appraiser_number, :appraisal_info, :status
end