class AddAttachmentAssetToPhotos < ActiveRecord::Migration
  def self.up
    change_table :photos do |t|
      t.has_attached_file :asset
    end
  end

  def self.down
    drop_attached_file :photos, :asset
  end
end
