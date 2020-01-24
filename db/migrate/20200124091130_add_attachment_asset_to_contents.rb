class AddAttachmentAssetToContents < ActiveRecord::Migration[5.1]
  def self.up
    change_table :contents do |t|
      t.attachment :asset
    end
  end

  def self.down
    remove_attachment :contents, :asset
  end
end
