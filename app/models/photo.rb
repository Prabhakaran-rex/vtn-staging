class Photo < ActiveRecord::Base
  belongs_to :appraisal
  belongs_to :user

  has_many :tags

  attr_accessible :picture, :default, :picture_cache, :name

  mount_uploader :picture, PictureUploader

  #has_attached_file :asset, 
            #:styles => {
              #:large => "500x500>",
              #:medium => "250x250>",
              #:thumb => "50x50#",
              #:carrousel => "460x460#",
              #:huge => "2048"
            #},
                    #:convert_options => {
                      #:all => '-auto-orient'storage
                    #},
                    #:storage => FILE_STORAGE[Rails.env]['storage'],
                    #:path => FILE_STORAGE[Rails.env]['path'],
                    #:url => FILE_STORAGE[Rails.env]['url'],
                    #:s3_credentials => "#{Rails.root.to_s}/config/s3.yml",
                    #:default_url => '/images/interface/missing.png'

  def set_as_default!(siblings)
    siblings.update_all(:default => false)
    self.default = true
    self.save
  end
end
