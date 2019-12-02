class CreateGalleries < ActiveRecord::Migration[5.1]
  def change
    create_table :galleries do |t|
      t.string :title
      t.text :description
      t.string :url
      t.string :link
      t.integer :sort
      t.boolean :slider

      t.timestamps
    end
  end
end
