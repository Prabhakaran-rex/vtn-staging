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
    aTypes = ["Social Light","Social Full"]

    if nType.nil? || nType < 0 || nType >= aTypes.length
      return ""
    else
      return aTypes[nType]
    end
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

end
