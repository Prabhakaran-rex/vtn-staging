class RemoveAttachmentAvatarFromUsers < ActiveRecord::Migration
  def up
    drop_attached_file :users, :avatar
  end

  def down
    change_table :users do |t|
      t.has_attached_file :avatar
    end
  end
end