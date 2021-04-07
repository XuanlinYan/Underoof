class City < ApplicationRecord
    has_many :preferences
    belongs_to :state
end
