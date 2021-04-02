class RemoveColumnUserConditionId < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :condition_id
  end
end
