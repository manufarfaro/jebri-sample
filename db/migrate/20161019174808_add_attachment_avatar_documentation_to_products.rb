class AddAttachmentAvatarDocumentationToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.attachment :avatar
      t.attachment :documentation
    end
  end

  def self.down
    remove_attachment :products, :avatar
    remove_attachment :products, :documentation
  end
end
