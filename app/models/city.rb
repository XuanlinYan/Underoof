class City < ApplicationRecord
    belongs_to :county, inverse_of: :cities

    validates :county, presence: true
    validates :name,   presence: true, uniqueness: {case_sensitive: false, scope: :county_id}
end
