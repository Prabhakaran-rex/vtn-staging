module ApplicationHelper

  def getStringForActivityType(eType)

    hItems = {EActivityTypeAdmin     => "Admin",
              EActivityTypeUser      => "User",
              EActivityTypeAppraiser => "Appraiser",
              EActivityTypeUnknown   => "Unknown"}

    if hItems[eType].empty?
      return ""
    else
      return hItems[eType]
    end

  end

  def getStringForActivityValue(eValue)
    eValue = eValue.to_i
    if APPRAISAL_STATUS[eValue].empty?
      return ""
    else
      return APPRAISAL_STATUS[eValue]
    end

  end

  def getStringForAppraisalDataType(eType)

    hItems = {EAppraisalDataTypeString    => "String",
              EAppraisalDataTypeLocation  => "Location",
              EAppraisalDataTypeValuation => "Valuation"}

    if hItems[eValue].empty?
      return ""
    else
      return hItems[eValue]
    end

  end

  def getStringForAppraisalType(nType)
    return "" if nType.nil?

    hItems = {EAAppraisalTypeShortRestricted => "Light Restricted Use Appraisal",
              EAAppraisalTypeLongRestricted  => "Full Restricted Use Appraisal",
              EAAppraisalTypeShortForSelling => "Light Summary Appraisal",
              EAAppraisalTypeLongForSelling => "Full Summary Appraisal", 
              EAAppraisalTypeShortRestrictedPair => "Light Restricted Use Appraisal Pair",
              EAAppraisalTypeLongRestrictedPair  => "Full Restricted Use Appraisal Pair",
              EAAppraisalTypeShortForSellingPair => "Light Summary Appraisal Pair",
              EAAppraisalTypeLongForSellingPair => "Full Summary Appraisal Pair"}

    hItems[nType].blank? ? "" : hItems[nType]
  end

  def getStringForPayoutStatus(status)
    return "" if status.nil?
    PAYOUT_STATUS[status].empty? ? "" : PAYOUT_STATUS[status]
  end

  def getStringForExpectedUse(nType)
    aTypes = ["Summary","Restricted"]

    if nType.nil? || nType < 0 || nType >= aTypes.length
      return ""
    else
      return aTypes[nType]
    end
  end


  def wicked_pdf_image_tag(img, options={})
    if img[0].chr == "/" # images from paperclip
      new_image = img.slice 1..-1
      image_tag "file://#{Rails.root.join('public', new_image)}", options
    elsif img[0].chr == "h" # images stored in s3
      image_tag img, options
    else
      image_tag "file://#{Rails.root.join('public', 'images', img)}", options
    end
  end

  def getProfileForUser(user)
    u = User.find(user)
    if !u.nil?
      return raw "#{image_tag u.avatar_url(:small), :size => '20x20', :class=>'gravatar-tiny'} #{u.name}" 
    else
      return ""
    end
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.simple_fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s + "/" + association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "btn btn-success add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def get_url_for_shared_appraisal(appraisal)
    show_shared_url(appraisal, format: :pdf)
  end

  def print_as_currency(number)
    number_to_currency(number, :locale => 'en-US')
  end

  def display_time(total_seconds)
    total_seconds = total_seconds.to_i

    days = total_seconds / 86400
    hours = (total_seconds / 3600) - (days * 24)
    minutes = (total_seconds / 60) - (hours * 60) - (days * 1440)
    seconds = total_seconds % 60

    display = ''
    display_concat = ''
    if days > 0
      display = display + display_concat + "#{days}d"
      display_concat = ' '
    end
    if hours > 0 || display.length > 0
      display = display + display_concat + "#{hours}h"
      display_concat = ' '
    end
    if minutes > 0 || display.length > 0
      display = display + display_concat + "#{minutes}m"
      display_concat = ' '
    end
    display = display + display_concat + "#{seconds}s"
    display
  end

  def get_cms_content(path)
    page = Cms::Page.find_by_full_path(path)
    return raw(page.nil? ? "Add content to '#{path}'" : page.content)
  end

  def get_page_title(path)
    page = Cms::Snippet.find_by_label("title-"+path)
    return raw(page.nil? ? "ValueThisNow: An Online Appraisal Service For Antiques & Collectibles" : page.content)
  end

  def get_page_description(path)
    page = Cms::Snippet.find_by_label("description-"+path)
    return raw(page.nil? ? "ValueThisNow is a group of online appraisers offering antique valuations and appraisals for everything from antiques and art paintings to toys and jewelry" : page.content)
  end

  def get_page_keywords(path)
    page = Cms::Snippet.find_by_label("keywords-"+path)
    return raw(page.nil? ? "" : page.content)
  end

  def get_static_page_html(path, col = 10, offset = 1)
    return raw "<div class='row'><div class='col-md-#{col} col-md-offset-#{offset}'>#{get_cms_content('/testimonials')}</div></div>"
  end

  def get_static_page_html2(path, col = 10, offset = 1)
    return raw "<div class='row'><div class='col-md-#{col} col-md-offset-#{offset}'>#{get_cms_content(path)}</div></div>"
  end

  def form_text_field(params)
    title = params[:title] || params[:field].to_s.titleize
    required = params[:required] || false
    label = params[:label] || false
    html_class = params[:html_class] || "input-xxlarge"
    html_style = params[:html_style]
    placeholder = params[:placeholder] || nil
    priority = params[:priority] || []
    as = params[:as] || :string
    input_html = {class: html_class, style: html_style}
    input_html.reverse_merge!(params[:input_html]) if params[:input_html]
    hint = params[:hint] || nil
    value = params[:value] || nil


    markup = "
      <div class='form-group'>
        <label class='col-sm-2 control-label'>Email</label>
        <div class='col-sm-10'>
          <%= f.input_field :email, class: 'form-control' %>
        </div>
      </div>"

    markup = "<tr><td class='formTitle' valign='top'>#{'*' if required} #{title}</td>"
    markup += "<td class='formBlock'>"
    markup += params[:form].input params[:field], as: as, required: required, label: label, input_html: input_html, placeholder: placeholder, priority: priority, value: value, hint: hint
    markup += "</td></tr>"
    return raw markup
  end


  def tb_field(params)
    label_width = params[:label_width] || 2
    field_width = params[:label_width] || 10
    title = params[:title] || params[:field].to_s.titleize
    form = params[:form]
    value = params[:value] || nil
    as = params[:as] || :string
    input_html = params[:input_html] || nil
    label = as == :hidden ? "" : "<label class='col-sm-#{label_width} control-label'>#{title}</label>"
    markup = "<div class='form-group'>" + label + "<div class='col-sm-#{field_width}'>"
    markup += params[:form].input_field :email, class: 'form-control', value: value, as: as, input_html: input_html
    markup += "</div></div>"
    return raw markup
  end

  def tb_submit_button(params = {})
    label_width = params[:label_width] || 2
    field_width = params[:label_width] || 10
    title = params[:title] || "Save"
    html_class = params[:html_class] || "btn btn-success"
    return raw "<div class='form-group'><div class='col-sm-offset-#{label_width} col-sm-#{field_width}'><button type='submit' class='#{html_class}'>#{title}</button></div></div>"
  end

  def form_submit_button(params)
    title = params[:title] || "Save"
    html_class = params[:html_class] || "btn btn-success"
    markup = "<tr><td class='formTitle' valign='top'></td>"
    markup += "<td class='formBlock'>"
    markup += params[:form].submit title.titleize, class: html_class
    markup += "</td></tr>"
    return raw markup
  end

  def css_class_for_active_page(params)
    html_class = "#{params[:class]}"
    html_class += " active" if current_page?(params[:path])
    raw "class = '#{html_class}'" unless html_class.blank?
  end

  def html_tab(params)
    markup = "<li>"
    markup = "<li #{css_class_for_active_page(params)}>"
    markup += "#{link_to params[:title], params[:path]}"
    markup += "</li>"
    return raw markup
  end

  # TODO Find a better place to store this monkeypatch
  def wizard_path(goto_step = nil, options = {})
    options = { :controller => :appraiser_steps,
                :action     => 'show',
                :id         => goto_step || params[:id],
                :only_path  => true
    }.merge options
    url_for(options)
  end
  #  TODO Return the price of partner customer
  def get_pricing_of_partner(user, selected_plan, is_xw = false)
    pricing = PartnerPricing.find_by_user_id(user)
    price = 0

    if selected_plan > 4
      selected_plan -= 4
      price += 20
    end

    plan = PAYMENT_PLAN_FOR_PARTNER[selected_plan]
    if is_xw.blank?
      case plan
        when "short_restricted"
          price += pricing.short_restricted
        when "full_restricted"
          price += pricing.full_restricted
        when "full_use"
          price += pricing.full_use      
      end
    else
      case plan
        when "short_restricted"
          price += pricing.short_restricted_xw
        when "full_restricted"
          price += pricing.full_restricted_xw
        when "full_use"
          price += pricing.full_use_xw
      end
    end

    return price
  end

end
