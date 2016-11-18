class AddAttachmentAvatarToProductFamilies < ActiveRecord::Migration
  def self.up
    change_table :product_families do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :product_families, :avatar
  end
end
