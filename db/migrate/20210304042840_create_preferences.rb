class CreatePreferences < ActiveRecord::Migration[6.1]
  def change
    create_table :preferences do |t|
      t.string :location
      t.date :start
      t.date :end
      t.string :userid

      t.timestamps
    end
  end
end
