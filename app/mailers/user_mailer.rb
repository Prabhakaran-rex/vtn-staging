class UserMailer < ActionMailer::Base
  default :from    => "admin@example.com",
          :sent_on => Time.now.to_s


  def invite_appraiser( token )
    @name  = token.name
    @token = token.token

    mail( :to      => token.email ,
          :subject => "Invite to create appraiser account" )
  end

  def notify_appraiser_of_new_appraisal(appraiser,appraisal)
    @appraiser = appraiser
    @appraisal = appraisal
    mail( :to      => @appraiser.email ,
          :subject => "A new appraisal is available" )
  end

  def notify_creator_of_appraisal_update( appraisal )
    @appraisal = appraisal
    mail( :to      => @appraisal.owned_by.email ,
          :subject => "The Appraisal for your item has been updated!" )
  end

  def contact_us(message)
    @message = message
    mail( :to => "support@myluckytreasure.com",
          :subject => "[Contact Us] #{message.subject}")
  end

  def appraiser_support(message)
    @message = message
    mail( #:to => "appraiser_support@colosses.com", 
          :to => "appraiser_support@yluckytreasure.com",
          :subject => "[Appraiser Support] #{message.subject}")
  end

  def user_support(message)
    @message = message
    mail( #:to => "appraiser_support@colosses.com", 
          :to => "wapankh@gmail.com",
          :subject => "[User Support] #{message.subject}")
  end

  private

  def add_attachment(attachment_name)
    attachment_path = "#{Rails.root}/attachments/#{attachment_name}"
    File.open(attachment_path) do |file|
      filename = File.basename(file.path)
      attachments[filename] = {:content_type => File.mime_type?(file), :content => file.read}
    end
  end

end