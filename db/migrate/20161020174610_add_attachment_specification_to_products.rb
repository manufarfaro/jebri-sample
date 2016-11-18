class AddAttachmentSpecificationToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.attachment :specification
    end
  end

  def self.down
    remove_attachment :products, :specification
  end
end
