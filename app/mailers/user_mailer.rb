class UserMailer < ActionMailer::Base
  helper :application
  default :from    => "no-reply@valuethisnow.com",
    :sent_on => Time.now.to_s

  def notify_appraiser_of_new_appraisal(appraiser,appraisal)
    @appraiser = appraiser
    @appraisal = appraisal
    mail( :to      => @appraiser.email ,
         :subject => "A new appraisal is available" )
  end

  def notify_appraisers_in_category(params)
    @appraiser = params[:appraiser]
    @comments = params[:comments]
    @category = params[:category]
    mail( :to      => @appraiser.email ,
         :subject => "Message for Appraisers in Category #{@category.name}" )
  end

  def notify_referral_of_new_appraisal(appraiser,appraisal)
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
    mail(:to => Setting.get("admin_distribution_list").split(','),
         :subject => "[Contact Us] #{message.subject}")
  end

  def appraiser_support(message)
    @message = message
    mail(:to => Setting.get("admin_distribution_list").split(','),
         :subject => "[Appraiser Support] #{message.subject}")
  end

  def user_support(message)
    @message = message
    mail(:to => Setting.get("admin_distribution_list").split(','),
         :subject => "[User Support] #{message.subject}")
  end

  def notify_admin_of_new_application(message)
    @message = message
    mail(:to => Setting.get("admin_distribution_list").split(','),
         :subject => "[New Appraiser Application] #{message.name}")
  end

  def notify_appraiser_of_application_result(appraiser,message, rejection_reasons = nil, additional_comments = nil)
    @message = message
    @status = appraiser.status
    @rejection_reasons = rejection_reasons
    @additional_comments = additional_comments
    mail( #:to => "appraiser_support@colosses.com",
         :to => appraiser.email,
         :subject => "[Your Value This Now Application] #{message.name}")
  end

  def notify_of_new_comment(comment)
    comment = Comment.find(comment)
    @body = comment.body
    @appraisal = Appraisal.find(comment.commentable_id)
    @send_to = comment.user_id == @appraisal.created_by ? @appraisal.assigned_to.email : User.find(@appraisal.created_by).email
    mail(:to => @send_to,
         :subject => "[Value This Now] New comment added"
        )
  end

  def notify_admin_of_suggested_rejection(params)
    @appraisal = Appraisal.find(params[:appraisal])
    @appraiser = @appraisal.assigned_to
    @customer = Customer.find(@appraisal.created_by)
    @reason = params[:rejection_reason]
    mail(:to => Setting.get("admin_distribution_list").split(','),
         :subject => "[Appraisal Suggested for Rejection] #{@appraisal.name[0..15]}")
  end

  def notify_user_of_rejection(appraisal, comments)
    @appraisal = Appraisal.find(appraisal)
    @customer = Customer.find(@appraisal.created_by)
    @additional_comments = comments.to_s
    mail(:bcc => Setting.get("admin_distribution_list").split(','),
         :to => @customer.email,
         :subject => "[Appraisal Rejected ] #{appraisal.name}")
  end

  def notify_appraiser_for_new_assign(appraiser_id)
    @appraiser = Appraiser.find(appraiser_id)
    mail(:to => @appraiser.email,
         :subject => "[Value This Now] An Appraisal has been assigned to you")
  end

  def notify_uncomplete_appraisal(appraisal, type_of_notify)
    @txt = Cms::Page.find_by_label("email_when_#{type_of_notify}")
    @appraisal = appraisal
    #@user = @appraisal.owned_by
    # Only test send mail
    @user = User.find(271) rescue nil
    if (@user && !@user.is_deny_email)
      # create a token from id
      crypt = ActiveSupport::MessageEncryptor.new(Devise.secret_key)
      @token = crypt.encrypt_and_sign(@user.id)
      unsubscribe_url = unsubscribe_url(token: @token)
      @content = @txt.content.gsub('UnsubscribeEmailUrl', unsubscribe_url)
      mail(:to => @user.email,
         :subject => "[Value This Now] Uncompleted Appraisal!")
    end
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
