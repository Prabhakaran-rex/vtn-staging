class RemovePaperclipSignatureFromUsers < ActiveRecord::Migration
  def self.up
    drop_attached_file :users, :signature
  end

  def self.down
    change_table :users do |t|
      t.has_attached_file :signature
    end
  end
end
