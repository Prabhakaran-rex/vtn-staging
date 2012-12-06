class AddWebsiteToAppraiserExtra < ActiveRecord::Migration
  def change
    add_column :appraiser_extras, :website, :string
  end
end
