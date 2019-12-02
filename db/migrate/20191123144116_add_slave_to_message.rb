class AddSlaveToMessage < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :slave, :text
  end
end
