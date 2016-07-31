class AddAttachmentProfilePicToGroups < ActiveRecord::Migration
  def self.up
    change_table :groups do |t|
      t.attachment :profile_pic
    end
  end

  def self.down
    remove_attachment :groups, :profile_pic
  end
end
