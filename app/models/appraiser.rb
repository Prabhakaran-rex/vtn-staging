class Appraiser < User

  alias_attribute :user_id, :id

  has_one :appraiser_extra
  alias_attribute :appraiser_info, :appraiser_extra
  accepts_nested_attributes_for :appraiser_extra
  after_create :create_appraiser_extra
  attr_accessible :appraiser_extra_attributes

  has_many :trade_references, :dependent => :destroy
  accepts_nested_attributes_for :trade_references, :allow_destroy => true
  attr_accessible :trade_references_attributes

  has_many :skills, :dependent => :destroy
  accepts_nested_attributes_for :skills, :allow_destroy => true
  attr_accessible :skills_attributes

  # The following is used for cropping & storing the signature image
  validates_attachment_size :signature, :less_than => 8.megabytes
  validates_attachment_content_type :signature, :content_type => /image/
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :reprocess_signature, :if => :cropping?

  has_attached_file :signature, :styles => {:standard => "550x550>", :small => { :processors => [:cropper], :geometry => '250x100!' }},
                    :convert_options => {
                      :all => '-auto-orient'
                    },
                    :storage => FILE_STORAGE[Rails.env]['storage'],
                    :path => FILE_STORAGE[Rails.env]['path'],
                    :url => FILE_STORAGE[Rails.env]['url'],
                    :s3_credentials => "#{Rails.root.to_s}/config/s3.yml",
                    :default_url => '/images/interface/missing.png'

  def is_appraiser_application_complete
    begin
      !self.name.empty? && self.address.valid? && self.appraiser_extra.valid? && self.skills.count > 0 && self.trade_references.count >= 3 && self.avatar?
    rescue Exception => e
      return false
    end
  end

  def submit_application
    self.status = EAUserStatusReview
    self.save
    notify_admin_of_new_application
  end

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  def signature_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(signature.path(style))
  end

  private
  def reprocess_signature
    signature.reprocess!
  end

  def notify_admin_of_new_application
    message = Message.new(:name => self.name, :email => self.email )
    UserMailer.notify_admin_of_new_application(message).deliver
  end

  def create_appraiser_extra
    y = AppraiserExtra.new(); y.appraiser_id = self.id;
    y.save(:validate => false)
  end
end