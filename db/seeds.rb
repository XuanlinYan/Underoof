require 'csv'

User.delete_all
Preference.delete_all

puts "Loading States..."
CSV.foreach(Rails.root.join("app/assets/csv/states.csv")) do |row|
  state_code = row[0]
  state_name = row[1]
  State.create_with(name: state_name).find_or_create_by!(two_digit_code: state_code)
end
p "Created #{State.count} states"

puts "Loading Counties..."
CSV.foreach(Rails.root.join("app/assets/csv/counties.csv")) do |row|
  state_code  = row[0]
  county_name = row[1]
  County.find_or_create_by!(state_id: State.find_by_two_digit_code(state_code).id, name: county_name)
end
p "Created #{County.count} counties"

puts "Loading Cities..."
CSV.foreach(Rails.root.join("app/assets/csv/cities.csv")) do |row|
  state_two_digit_code = row[0]
  state_id = State.find_by_two_digit_code!(state_two_digit_code).id

  county_name = row[1]
  city_name   = row[2]
  county      = County.find_by_state_id_and_name!(state_id, county_name)
  City.find_or_create_by!(county_id: county.id, name: city_name)
end
p "Created #{City.count} cities"

100.times do |index|
    User.create!(name: Faker::Name.unique.name,
                  password: Faker::Internet.password(min_length: 8, max_length: 10, mix_case: true) + Faker::Number.binary(digits: 4),
                  email: Faker::Internet.email,
                  gender: ['Female', 'Male', 'Prefer not to answer'].sample)
end
p "Created #{User.count} users"

100.times do |index|
    curr_state_id = State.all.sample.id
    curr_county_id = County.where(state_id: curr_state_id).sample.id
    curr_city_id = City.where(county_id: curr_county_id).sample.id
    Preference.create!(state_id: curr_state_id, county_id: curr_county_id, city_id: curr_city_id,
                        location: Faker::Address.street_address()+', '+Faker::Address.city,
                        start_date: Faker::Date.between(from: 2.year.ago, to: 500.day.ago),
                        end_date: Faker::Date.between(from: 400.day.ago, to: 1.day.ago),
                        min_price: Faker::Number.between(from: 1, to: 2500), max_price: Faker::Number.between(from: 2500, to: 5000), 
                        pet: ['Dog', 'Cat', 'No'].sample, 
                        user_id: User.all.sample.id)
end
p "Created #{Preference.count} preference tables"


