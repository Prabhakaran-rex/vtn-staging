class ChangeAppraiserExtraStringFormats < ActiveRecord::Migration
  def up
  	change_column :appraiser_extras, :years_appraising, :text
  	change_column :appraiser_extras, :affiliated_with, :text
  	change_column :appraiser_extras, :certifications, :text
  	change_column :appraiser_extras, :description, :text
  end

  def down
  	change_column :appraiser_extras, :years_appraising, :string
  	change_column :appraiser_extras, :affiliated_with, :string
  	change_column :appraiser_extras, :certifications, :string
  	change_column :appraiser_extras, :description, :string
  end
end
