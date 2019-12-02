class AddProductIdToGallery < ActiveRecord::Migration[5.1]
  def change
    add_reference :galleries, :product, foreign_key: true
  end
end
