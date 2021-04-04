class CreateCounties < ActiveRecord::Migration[6.1]
  def change
    create_table :counties do |t|
      t.string :name
      t.references :state, foreign_key: true
      t.timestamps
    end
  end
end
