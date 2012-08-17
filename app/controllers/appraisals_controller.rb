class AppraisalsController < ApplicationController
  load_and_authorize_resource

  # GET /appraisals
  # GET /appraisals.xml
  def index
    @user = User.find_by_id(current_user)
  
    if @user.role.eql?("user")
      redirect_to users_url
    else
      @appraisals = Appraisal.where(:assigned_to => current_user, :status =>EActivityValueClaimed )
      @appraisals = Appraisal.where(:status => EActivityValueCreated) unless @appraisals.count > 0

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
    @user = User.find_by_id(current_user)
    if (!@appraisal.assigned_to.nil?)
      @appraiser = User.find_by_id(@appraisal.assigned_to)
    end
    flash[:title] = "Appraisal" unless !flash[:title].nil?

    respond_to do |format|
      format.html #{ render :layout => 'shareable' }# show.html.erb
      format.xml  { render :xml => @appraisal }
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
    @appraisal = Appraisal.new(params[:appraisal])
    @appraisal.created_by = current_user.id
    @appraisal.status = EActivityValueCreated
    
      if @appraisal.save
        session[:new_appraisal] = @appraisal
        log_activity(@appraisal)
        redirect_to payments_path
        
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
    if @appraisal.status == EActivityValueCreated
      @appraisal.assigned_to = current_user
      @appraisal.assigned_on = Time.now
      @appraisal.status = EActivityValueClaimed
      log_activity(@appraisal) unless !@appraisal.save
      redirect_to reply_appraisal_path(@appraisal)
    else
      redirect_to(@appraisal, :alert => "You cannot claim this appraisal at this time")
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
    
end
