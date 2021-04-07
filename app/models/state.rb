class State < ApplicationRecord
    has_many :preferences
    has_many :cities, inverse_of: :city, dependent: :destroy
    validates :name,           presence: true, uniqueness: {case_sensitive: false}
    validates :two_digit_code, presence: true, uniqueness: {case_sensitivie: false}
    
end
