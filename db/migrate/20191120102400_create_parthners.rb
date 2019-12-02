class CreateParthners < ActiveRecord::Migration[5.1]
  def change
    create_table :parthners do |t|
      t.string :title
      t.text :description
      t.string :url
      t.string :link
      t.string :complectation_id
      t.boolean :show

      t.timestamps
    end
  end
end
