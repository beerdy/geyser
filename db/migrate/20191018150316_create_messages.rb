class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :name
      t.string :phone
      t.text :description

      t.timestamps
    end
  end
end
