class AddAttachmentDocumentationSpecificationToModels < ActiveRecord::Migration
  def self.up
    change_table :models do |t|
      t.attachment :documentation
      t.attachment :specification
    end
  end

  def self.down
    remove_attachment :models, :documentation
    remove_attachment :models, :specification
  end
end
