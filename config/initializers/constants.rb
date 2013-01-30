# Constants
## ActivityType
EActivityTypeAdmin      =  0
EActivityTypeUser       =  1
EActivityTypeAppraiser  =  2
EActivityTypeUnknown    =  3
## ActivityValue
EActivityValueCreated   =  0
EActivityValueEdited    =  1
EActivityValueResponded =  2
EActivityValueCommented =  3
EActivityValueAnnotated =  4
EActivityValueClosed    =  5
EActivityValueDeleted   =  6
EActivityValueAppealed  =  7
EActivityValueViewed    =  8
EActivityValueClaimed   =  9
EActivityValueFinalized = 10
EActivityValueWithdrawn = 11
EActivityValuePayed   = 12
EActivityValueHidden = 13
APPRAISAL_STATUS = {EActivityValueCreated   => "Incomplete",
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
	              EActivityValuePayed     => "Unclaimed",
		          EActivityValueHidden    => "Hidden"}
## AppraisalDataType
EAppraisalDataTypeString    = 0
EAppraisalDataTypeLocation  = 1
EAppraisalDataTypeValuation = 2
## UserStatus
EAUserStatusPending = 1
EAUserStatusConfirmed = 2
EAUserStatusBlocked = 3
EAUserStatusRejected = 4
EAUserStatusReview = 5
## UserStatus as hash
EAUserStatusHash = Hash["1" => "Pending","2" => "Confirmed", "3" => "Blocked", "4" => "Rejected", "5" => "Under Review"]
## USPAP
EAAppraiserUSPAPFamiliar = 1 # I am familiar with and write to the standards of USPAP
EAAppraiserUSPAPSubjectExpert = 2 # I am a subject matter expert in my field
EAAppraiserUSPAPExperienced = 3 # I have experience writing restricted use reports and summary reports
EAAppraiserUSPAPExtensive = 4 # I am a subject matter expert with extensive market - related experience and knowledge in my areas of specialization
## Appraisal Type
EAAppraisalTypeShortRestricted = 1
EAAppraisalTypeLongRestricted = 2
EAAppraisalTypeShortForSelling = 3
EAAppraisalTypeLongForSelling = 4
APPRAISAL_PLANS = [EAAppraisalTypeShortRestricted, EAAppraisalTypeLongRestricted, EAAppraisalTypeShortForSelling, EAAppraisalTypeLongForSelling]
## Payouts
EAPayoutPending = 0
EAPayoutCompleted = 1
PAYOUT_STATUS = {EAPayoutPending => "Pending",
	              EAPayoutCompleted => "Completed"}
