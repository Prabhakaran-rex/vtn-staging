class AddInvoiceIdToAppraisals < ActiveRecord::Migration
  def change
    add_column :appraisals,	:invoice_id,	:integer
  end
end
