class AddPrefIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :pref_id, :integer
    add_index :users, :pref_id
  end
end
