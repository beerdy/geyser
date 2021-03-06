class CreateContents < ActiveRecord::Migration[5.1]
  def change
    create_table :contents do |t|
      t.string :title
      t.text :description
      t.text :slave
      t.string :url
      t.string :link
      t.integer :sort

      t.timestamps
    end
  end
end
