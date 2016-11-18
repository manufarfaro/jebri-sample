class AddAttachmentAvatarToCommerces < ActiveRecord::Migration
  def self.up
    change_table :commerces do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :commerces, :avatar
  end
end
