class Preference < ApplicationRecord
   belongs_to :user
   belongs_to :state
   belongs_to :county
   belongs_to :city
end
