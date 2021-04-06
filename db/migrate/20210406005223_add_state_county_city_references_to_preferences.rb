class AddStateCountyCityReferencesToPreferences < ActiveRecord::Migration[6.1]
  def change
    add_reference :preferences, :state, index: true
    add_reference :preferences, :county, index: true
    add_reference :preferences, :city, index: true
  end
end
