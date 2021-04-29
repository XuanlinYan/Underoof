class AddDirectMessageToChannels < ActiveRecord::Migration[6.1]
  def change
    add_column :channels, :direct_message, :boolean, default: false
  end
end
