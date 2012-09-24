class AddAttachmentSignatureToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.has_attached_file :signature
    end
  end

  def self.down
    drop_attached_file :users, :signature
  end
end
