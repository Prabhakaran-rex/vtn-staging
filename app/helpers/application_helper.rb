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

    hItems = {EActivityValueCreated   => "Created",
              EActivityValueEdited    => "Edited",
              EActivityValueResponded => "Responded",
              EActivityValueCommented => "Commented",
              EActivityValueAnnotated => "Annotated",
              EActivityValueClosed    => "Closed",
              EActivityValueDeleted   => "Deleted",
              EActivityValueAppealed  => "Appealed",
              EActivityValueViewed    => "Viewed",
              EActivityValueClaimed   => "Claimed",
              EActivityValueFinalized => "Finalized",
              EActivityValueWithdrawn => "Withdrawn"}

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

end
