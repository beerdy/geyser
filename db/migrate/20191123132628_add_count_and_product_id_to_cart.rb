class AddCountAndProductIdToCart < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :count, :integer
    add_reference :carts, :product_id, foreign_key: true
  end
end
