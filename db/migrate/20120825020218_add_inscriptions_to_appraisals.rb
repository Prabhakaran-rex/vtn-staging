class AddInscriptionsToAppraisals < ActiveRecord::Migration
  def change
    add_column :appraisals, :inscriptions, :text
  end
end
