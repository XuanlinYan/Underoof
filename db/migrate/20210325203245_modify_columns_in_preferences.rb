class ModifyColumnsInPreferences < ActiveRecord::Migration[6.1]
  def change
    remove_column :preferences, :userid

    add_column :preferences, :min_price, :integer
    add_column :preferences, :max_price, :integer
    add_column :preferences, :pet, :string
    add_reference :preferences, :user, index: true
  end
end
