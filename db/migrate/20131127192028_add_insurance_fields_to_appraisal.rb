class AddInsuranceFieldsToAppraisal < ActiveRecord::Migration
  def change
    add_column :appraisals, :insurance_claim, :boolean, default: false
    add_column :appraisals, :insurance_prior, :boolean, default: false
    add_column :appraisals, :insurance_location, :text
  end
end
