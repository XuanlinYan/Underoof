class AddDmToChannels < ActiveRecord::Migration[6.1]
  def change
    add_column :channels, :dm, :boolean, default: false
  end
end
