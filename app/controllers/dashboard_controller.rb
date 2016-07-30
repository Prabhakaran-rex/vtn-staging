class DashboardController < ApplicationController
	before_filter :authenticate_user!
	def index
		@user = current_user
		if @user.is_customer?
			redirect_to users_url
		elsif @user.is_appraiser? and !@user.is_confirmed?
			redirect_to appraiser_steps_path
		else

			case @detail = params[:detail]
				when "processing"
					@appraisals = Appraisal.where("assigned_to = ? and status = ?",current_user,EActivityValueClaimed).order("updated_at desc")
				when "unclaimed"
          @appraisals = Appraisal.where('(status = ? AND assigned_to IS null) OR (status = ? AND assigned_to = ?)', EActivityValuePayed, EActivityValuePayed, current_user.id)
          if Setting.is_set("show_all_appraisals","false")
            @specializedAppraisals = Appraisal.select("appraisals.id").joins(:classification => {:category => {:skills => :appraiser}}).where('appraisals.status in (?) and categories.id in (?)', [EActivityValuePayed, EActivityValueFinalized,EActivityValueClaimed ],current_user.skills.pluck(:category_id).uniq).pluck('appraisals.id').uniq
            @appraisals = @appraisals.where("id in (?)",@specializedAppraisals).order("updated_at desc")
          end
				when "referrals"
					@appraisals = Appraisal.where("appraiser_referral = ? and status = ?",current_user.referral_id,EActivityValuePayed).order("updated_at desc")
				when "completed"
					@appraisals = Appraisal.where("assigned_to = ? and status = ?",current_user,EActivityValueFinalized).order("updated_at desc")
        else
          # For unclaimed status
          @appraisals = Appraisal.where('(status = ? AND assigned_to IS null) OR (status = ? AND assigned_to = ?)', EActivityValuePayed, EActivityValuePayed, current_user.id).order("updated_at desc")

          # For all status
					# @appraisals = Appraisal.where("(status = ? AND assigned_to IS null) OR (assigned_to = ? )", EActivityValuePayed, current_user.id)
          
          if Setting.is_set("show_all_appraisals","false")
            @specializedAppraisals = Appraisal.select("appraisals.id").joins(:classification => {:category => {:skills => :appraiser}}).where('appraisals.status in (?) and categories.id in (?)', [EActivityValuePayed, EActivityValueFinalized,EActivityValueClaimed ],current_user.skills.pluck(:category_id).uniq).pluck('appraisals.id').uniq
            @appraisals = @appraisals.where("id in (?)",@specializedAppraisals)
          end

				end
			@appraisals = @appraisals.visible	unless @appraisals.nil?

			respond_to do |format|
				format.html # index.html.haml
				format.xml  { render :xml => @appraisals }
			end
		end
	end

	def payouts
		@payouts = Payout.joins(:appraisal).where("appraisals.assigned_to = ?",current_user).order(:created_at)

		case params[:status]
		when 'pending'
			@payouts = @payouts.where("payouts.created_at > ?", Time.now.beginning_of_month)
    when 'previous'
      @payouts = @payouts.where("payouts.created_at > ? and payouts.created_at <= ?", Time.now.beginning_of_month - 1.month, Time.now.beginning_of_month)
		when 'history'
			@payouts
		end
	end
end
