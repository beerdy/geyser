class AddSessionToMessage < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :session, :string
  end
end
