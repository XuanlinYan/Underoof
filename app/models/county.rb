class County < ApplicationRecord
    has_many :preferences
    belongs_to :state, inverse_of: :counties
    has_many   :cities, inverse_of: :county, dependent: :destroy
  
    validates :state, presence: true
    validates :name,  presence: true, uniqueness: {case_sensitive: false, scope: :state_id}
end
