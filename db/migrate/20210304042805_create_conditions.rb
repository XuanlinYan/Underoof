class CreateConditions < ActiveRecord::Migration[6.1]
  def change
    create_table :conditions do |t|
      t.string :location
      t.date :start
      t.date :end
      t.string :userid

      t.timestamps
    end
  end
end
