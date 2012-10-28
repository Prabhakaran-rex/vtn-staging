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

    hItems = {EActivityValueCreated   => "Incomplete",
              EActivityValueEdited    => "Edited",
              EActivityValueResponded => "Responded",
              EActivityValueCommented => "Commented",
              EActivityValueAnnotated => "Annotated",
              EActivityValueClosed    => "Closed",
              EActivityValueDeleted   => "Deleted",
              EActivityValueAppealed  => "Appealed",
              EActivityValueViewed    => "Viewed",
              EActivityValueClaimed   => "Processing",
              EActivityValueFinalized => "Complete",
              EActivityValueWithdrawn => "Withdrawn",
              EActivityValuePayed     => "Unclaimed"}

    if hItems[eValue].empty?
      return ""
    else
      return hItems[eValue]
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

    hItems = {EAAppraisalTypeShortRestricted => "Social Light Restricted Use Appraisal",
              EAAppraisalTypeLongRestricted  => "Social Full Restricted Use Appraisal",
              EAAppraisalTypeShortForSelling => "Social Light Summary Appraisal",
              EAAppraisalTypeLongForSelling => "Social Full Summary Appraisal"}

    hItems[nType].empty? ? "" : hItems[nType]
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
    if !u.nil? && !u.appraiser_info.public_email.nil? && !u.appraiser_info.public_email.blank? && !u.appraiser_info.public_email.empty?
      return raw "#{image_tag u.avatar_url(:small), :size => '20x20', :class=>'gravatar-tiny'} #{u.name}" 
    else
      return "#{u.name}"
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
    show_shared_url(appraisal)
  end

end
