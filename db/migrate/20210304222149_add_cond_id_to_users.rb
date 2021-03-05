class AddCondIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :cond_id, :integer
    add_index :users, :cond_id
  end
end
