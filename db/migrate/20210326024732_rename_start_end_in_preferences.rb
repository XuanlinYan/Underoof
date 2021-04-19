class RenameStartEndInPreferences < ActiveRecord::Migration[6.1]
  def change
    rename_column :preferences, :start, :start_date
    rename_column :preferences, :end, :end_date
  end
end
