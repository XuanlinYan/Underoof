class RemovePreferenceIdInUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :preference_id
  end
end
