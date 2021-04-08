class Preference < ApplicationRecord
   belongs_to :user
   belongs_to :state
   belongs_to :city

   
   validates :location, presence: true
   validates :start_date, presence: true
   validates :end_date, presence: true
   validate :end_after_start

   validates :min_price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
   validates :max_price, presence: true, numericality: { only_integer: true, greater_than: :min_price }

   validates :pet, presence: true

   validates :user_id, presence: true
   validates :state_id, presence: true
   validates :city_id, presence: true

   private

   def end_after_start
      return if end_date.blank? || start_date.blank?
 
      if end_date < start_date
         errors.add(:end_date, "must be after the start date") 
      end 
   end
end
