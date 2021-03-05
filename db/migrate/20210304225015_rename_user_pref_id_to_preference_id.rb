class RenameUserPrefIdToPreferenceId < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :pref_id, :preference_id
  end
end
