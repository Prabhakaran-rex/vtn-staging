module AppraisalsHelper

  def print_replacement_cost(appraisal)
    return "-" if (appraisal.status != EActivityValueFinalized && appraisal.status != EActivityValueClaimed)
    unless (appraisal.appraisal_info.replacement_cost_min.blank? || appraisal.appraisal_info.replacement_cost_max.blank?)
      "#{print_as_currency(appraisal.appraisal_info.replacement_cost_min)} to #{print_as_currency(appraisal.appraisal_info.replacement_cost_max)} " 
    end
  end

  def print_fair_market_value(appraisal)
    return "-" if (appraisal.status != EActivityValueFinalized && appraisal.status != EActivityValueClaimed)
    unless (appraisal.appraisal_info.fair_market_value_min.blank? || appraisal.appraisal_info.fair_market_value_max.blank?)
      "#{print_as_currency(appraisal.appraisal_info.fair_market_value_min)} to #{print_as_currency(appraisal.appraisal_info.fair_market_value_max)}"
    end
  end

  def print_amount_paid(appraisal)
    if appraisal.status == EActivityValueFinalized && !appraisal.payout.nil?
      "#{print_as_currency(appraisal.payout.amount)}"
    end
  end

  def print_payout_status(appraisal)
    if appraisal.status == EActivityValueFinalized && !appraisal.payout.nil?
      "#{getStringForPayoutStatus(appraisal.payout.status)}"
    end
  end

  def linked_thumbnail(appraisal)
    link_to image_tag(appraisal.default_photo.picture_url(:thumb), :class => "tagThumb"), _get_linked_path(appraisal), :title => h(appraisal.title) unless appraisal.photos.count == 0
  end

  def linked_title(appraisal)
    badge = "<span class='label'><i class='icon-lock icon-white'></i></span>" unless appraisal.appraiser_referral.blank?
    link_to(raw(badge) + h(appraisal.title) + " ##{appraisal.id}", _get_linked_path(appraisal))
  end

  def completed_on(appraisal)
    return "-" if appraisal.status != EActivityValueFinalized
    distance_of_time_in_words(Time.now,appraisal.updated_at) + " ago"
  end

  def appraisal_buttons(appraisal, role = 'appraiser', small = false)
    if role == "appraiser"
      if small
        case appraisal.status
        when EActivityValueClaimed
          link_to reply_appraisal_path(appraisal), :class => "btn btn-success btn-xs" do raw('<span class="glyphicon glyphicon-edit"></spani>') end
        when EActivityValuePayed
          link_to appraisal, :class => "btn btn-success btn-xs" do raw('<span class="glyphicon glyphicon-folder-open"></span>') end
        when EActivityValueFinalized
          link_to show_shared_path(appraisal, :format => :pdf), :class => "btn btn-success btn-xs" do raw('<span class="glyphicon glyphicon-download-alt"></i>') end
        end
      else
        case appraisal.status
        when EActivityValueClaimed
          link_to reply_appraisal_path(appraisal), :class => "btn btn-success btn-sm" do raw('<span class="glyphicon glyphicon-edit"></span> Reply') end
        when EActivityValuePayed
          link_to appraisal, :class => "btn btn-success btn-sm" do raw('<span class="glyphicon glyphicon-folder-open"></span> View') end
        when EActivityValueFinalized
          link_to "Download PDF", show_shared_path(appraisal, :format => :pdf), :class => "btn btn-success btn-sm" 
        end
      end
    end
  end

  private
  def _get_linked_path(appraisal)
    return appraisal.status == EActivityValueCreated ? appraisal_build_index_path(appraisal) : appraisal
  end


end


