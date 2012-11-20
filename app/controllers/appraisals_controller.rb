class AppraisalsController < ApplicationController
  load_and_authorize_resource
  before_filter :is_appraiser_confirmed, :except => [:wizard_photo_upload, :wizard_categories, :show_shared]

  # GET /appraisals
  # GET /appraisals.xml
  def index
    @user = User.find_by_id(current_user)
  
    if @user.role.eql?("user")
      redirect_to users_url
    else
      @appraisals = []
      if params[:specialized]
        @specializedAppraisals = Appraisal.select("appraisals.id").joins(:classifications => {:category => {:skills => :appraiser}}).where('appraisals.status in (?) and categories.id in (?)', [EActivityValuePayed, EActivityValueFinalized,EActivityValueClaimed ],current_user.skills.pluck(:category_id).uniq).pluck('appraisals.id').uniq
        @appraisals << Appraisal.where('status = ? and id in(?) ', EActivityValuePayed,@specializedAppraisals)
        @appraisals << Appraisal.where("assigned_to = ? and status = ? and id in(?)",current_user,EActivityValueClaimed,@specializedAppraisals)
        @appraisals << Appraisal.where("assigned_to = ? and status = ? and id in(?)",current_user,EActivityValueFinalized, @specializedAppraisals)
      else
        # TODO Check if performance can be improved
        # Order appraisals by specific status
        @specializedAppraisals = nil
        @appraisals << Appraisal.where('status = ?', EActivityValuePayed)
        @appraisals << Appraisal.where("assigned_to = ? and status = ?",current_user,EActivityValueClaimed)
        @appraisals << Appraisal.where("assigned_to = ? and status = ?",current_user,EActivityValueFinalized)
      end
      @appraisals = @appraisals.flatten
      # @appraisals = Appraisal.where(:status => EActivityValuePayed) unless @appraisals.count > 0

      respond_to do |format|
        format.html # index.html.haml
        format.xml  { render :xml => @appraisals }
      end
    end
  end

  # GET /appraisals/1
  # GET /appraisals/1.xml
  def show
    @appraisal = Appraisal.find(params[:id])
    @long ||= params[:pdf_long]
    @user = User.find_by_id(current_user)
    if (!@appraisal.assigned_to.nil?)
      @appraiser = User.find_by_id(@appraisal.assigned_to)
    end
    flash[:title] = "Appraisal" unless !flash[:title].nil?

    respond_to do |format|
      format.html #{ render :layout => 'shareable' }# show.html.erb
      format.xml  { render :xml => @appraisal }
      format.pdf { render :pdf => 'file_name.pdf', :show_as_html => params[:debug].present?, :template => "/appraisals/finalized.pdf.erb", :footer => {:font_size => 8, :left => "Security Code: #{Digest::SHA1.hexdigest(@appraisal.to_json)}",  :right => '[page] of [topage]' } }
    end
  end

  def show_shared
    @appraisal = Appraisal.find(params[:id])
    @appraiser = @appraisal.assigned_to

    if @appraisal.shared
      respond_to do |format|
        format.html
      end
    else
      redirect_to root_path
    end
  end

  # GET /appraisals/new
  # GET /appraisals/new.xml
  def new
    @appraisal = Appraisal.new
    1.times { @appraisal.photos.build }

    respond_to do |format|
      format.html # new.html.haml
      format.xml  { render :xml => @appraisal }
    end
  end

  # GET /appraisals/1/edit
  def edit
    @appraisal = Appraisal.find(params[:id])
  end

  def reply
    @appraisal = Appraisal.find(params[:id])
    1.times { @appraisal.appraisal_datums.build }
  end

  # POST /appraisals
  # POST /appraisals.xml
  def create
    params[:appraisal][:appraisal_info] = AppraisalInfo.new(params[:appraisal][:appraisal_info])
    @appraisal = Appraisal.new(params[:appraisal])
    @appraisal.created_by = current_user.id
    @appraisal.status = EActivityValueCreated
    
      if @appraisal.save
        session[:new_appraisal] = @appraisal.id
        log_activity(@appraisal)
        # redirect_to payments_path(:appraisal_id => @appraisal.id) 
        redirect_to wizard_photo_upload_path(:appraisal_id => @appraisal.id)     
      else
        respond_to do |format|
          flash[:error] = 'Appraisal cannot be created!'
          format.html { render :action => "new" }
          format.xml  { render :xml => @appraisal.errors, :status => :unprocessable_entity }
        end
      end
    
  end

  # PUT /appraisals/1
  # PUT /appraisals/1.xml
  def update
    @appraisal = Appraisal.find(params[:id])
    params[:appraisal][:appraisal_info] = Hash.new if params[:appraisal][:appraisal_info].nil?
    current_appraisal_info = @appraisal.appraisal_info.instance_values
    current_appraisal_info.merge!(AppraisalInfo.new(params[:appraisal][:appraisal_info]).instance_values)
    params[:appraisal][:appraisal_info] = AppraisalInfo.new(current_appraisal_info)
    

    respond_to do |format|
      if @appraisal.update_attributes(params[:appraisal])
        if @appraisal.status == EActivityValueFinalized
          # Send Notification via Email to Creator about Finalized Appraisal
          @appraisal.owned_by.notify_creator_of_appraisal_update( @appraisal )
        end
      log_activity(@appraisal)
        format.html { redirect_to(@appraisal, :notice => 'Appraisal was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @appraisal.errors, :status => :unprocessable_entity }
      end
    end
  end


  # DELETE /appraisals/1
  # DELETE /appraisals/1.xml
  def destroy
    @appraisal = Appraisal.find(params[:id])
    @appraisal.destroy

    respond_to do |format|
      format.html { redirect_to(@appraisal, :notice => 'Appraisal was deleted successfully.') }
      format.xml  { head :ok }
    end
  end
  
  def claim
    @appraisal = Appraisal.find(params[:id])
    if @appraisal.status == EActivityValuePayed
      @appraisal.assigned_to = current_user
      @appraisal.assigned_on = Time.now
      @appraisal.status = EActivityValueClaimed
      log_activity(@appraisal) unless !@appraisal.save
      redirect_to reply_appraisal_path(@appraisal)
    else
      redirect_to(@appraisal, :alert => "Please try claiming this item again in a few minutes.")
    end
  end

  # TODO Remove this
  def test
    @appraisal = Appraisal.find(params[:id])
    @user = User.find_by_id(current_user)
    if (!@appraisal.assigned_to.nil?)
      @appraiser = User.find_by_id(@appraisal.assigned_to)
    end
    flash[:title] = "Appraisal" unless !flash[:title].nil?

    respond_to do |format|
      format.html #{ render :layout => 'shareable' }# show.html.erb
      format.xml  { render :xml => @appraisal }
      format.pdf { render :pdf => 'file_name.pdf', :page_size => "letter", :show_as_html => params[:debug].present?, :template => "/appraisals/finalized.pdf.erb" }
    end
  end

  def wizard_photo_upload
    @appraisal = Appraisal.find(params[:appraisal_id])
  end

  def wizard_categories
    @appraisal = Appraisal.find(params[:appraisal_id])
  end

  def share
    @appraisal = Appraisal.find(params[:appraisal_id])
    if !@appraisal.nil? && current_user.id == @appraisal.created_by
      @appraisal.shared = true
      @appraisal.save
    end
    respond_to do |format|
      format.json  { render :json =>  @appraisal }
    end
  end


  protected

  def log_activity(appraisal)
    activity = AppraisalActivity.new({:appraisal_id   => appraisal.id,
                                      :user_id      => current_user.id,
                                      :activity_type  => User.roles.index(current_user.role),
                                      :activity_value => appraisal.status
                                     })
    activity.save
  end

  def is_appraiser_confirmed
    redirect_to :appraiser_steps if current_user.role == 'appraiser' && current_user.status != EAUserStatusConfirmed
  end    
end
