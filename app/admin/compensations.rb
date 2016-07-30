ActiveAdmin.register Compensation do
  actions :all, :except => [:destroy]
  hItems = {"Light Restricted Use Appraisal" => EAAppraisalTypeShortRestricted,
            "Full Restricted Use Appraisal" => EAAppraisalTypeLongRestricted,
            "Light Summary Appraisal" => EAAppraisalTypeShortForSelling,
            "Full Summary Appraisal" => EAAppraisalTypeLongForSelling,
            "Light Restricted Use Appraisal Pair" => EAAppraisalTypeShortRestrictedPair,
            "Full Restricted Use Appraisal Pair" => EAAppraisalTypeLongRestrictedPair,
            "Light Summary Appraisal Pair" => EAAppraisalTypeShortForSellingPair,
            "Full Summary Appraisal Pair" => EAAppraisalTypeLongForSellingPair}

  menu :label => "Compensation Rules", :parent => "Compensations"
  index do
    column :id
    column :appraisal_plan do |compensation|
      getStringForAppraisalType(compensation.appraisal_plan)
    end
    column "Amount Paid" do |compensation|
      print_as_currency(compensation.amount)
    end
    column "Range (hours)" do |compensation|
      unless compensation.is_over
        "#{compensation.min_range} to #{compensation.max_range}"
      else
        "Over #{compensation.min_range}" if compensation.is_over
      end
    end

    default_actions
  end

  filter :appraisal_plan, :as => :select, :collection => hItems
  filter :amount
  filter :min_range
  filter :max_range


  form do |f|
    within @head do
      script :src => javascript_path('compensation'), :type => "text/javascript"
    end
    f.inputs "New Compensation" do
      f.input :appraisal_plan, :as => :select, :collection => hItems
      f.input :amount, :hint => "Enter the amount in dollars to be paid to the appraiser"
      f.input :min_range, :hint => "In hours"
      f.input :max_range, :hint => "In hours"
      f.input :is_over, label: "Do not have the Max range"
    end
    f.actions
  end

  show do
    attributes_table do
      row("Amount Paid") {compensation.amount}
      row("Appraisal Plan") {getStringForAppraisalType(compensation.appraisal_plan)}
      row("Min Range") {compensation.min_range}
      row("Max Range") {compensation.max_range}
    end
  end

  controller do
    # This code is evaluated within the controller class

    def update
      super
      if params[:compensation][:is_over] == "1"
        @admin_compensation = Compensation.find(params[:id])
        @admin_compensation.update_attributes(max_range: nil)
      end



    end
  end

end

ActiveAdmin.register_page "Compensation Table" do
  menu :label => "Compensation Table", :parent => "Compensations"
  content do
    render :partial => "admin/compensations/compensation_table"
  end
end
