class Photo < ActiveRecord::Base
  validates_attachment_size :asset, :less_than => 8.megabytes
  validates_attachment_content_type :asset, :content_type => /image/

  belongs_to :appraisal
  belongs_to :user

  has_many :tags

  attr_accessible :asset

  has_attached_file :asset, 
  					:styles => {
              :large => "500x500>",
  						:medium => "250x250>",
  						:thumb => "150x50>",
              :carrousel => "460x460#"
  					},
                    :convert_options => {
                    	:all => '-auto-orient'
                    },
                    :storage => FILE_STORAGE[Rails.env]['storage'],
                    :path => FILE_STORAGE[Rails.env]['path'],
                    :url => FILE_STORAGE[Rails.env]['url'],
                    :s3_credentials => "#{Rails.root.to_s}/config/s3.yml",
                    :default_url => '/images/interface/missing.png'
end
