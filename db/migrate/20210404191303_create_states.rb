class CreateStates < ActiveRecord::Migration[6.1]
  def change
    create_table :states do |t|
      t.string :name
      t.string :two_digit_code
      t.timestamps
    end
  end
end
