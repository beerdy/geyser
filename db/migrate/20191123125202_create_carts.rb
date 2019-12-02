class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.string :session
      t.string :product
      t.integer :quantify
      t.boolean :active

      t.timestamps
    end
  end
end
