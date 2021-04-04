class RenameUserCondIdToConditionId < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :cond_id, :condition_id
  end
end
