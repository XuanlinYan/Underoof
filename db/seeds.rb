User.delete_all
Preference.delete_all

100.times do |index|
    User.create!(name: Faker::Name.unique.name,
                  password: Faker::Internet.password(min_length: 8, max_length: 10, mix_case: true) + Faker::Number.binary(digits: 4),
                  email: Faker::Internet.email,
                  gender: ['Female', 'Male', 'Prefer not to answer'].sample)
end
p "Created #{User.count} users"

100.times do |index|
    Preference.create!(location: Faker::Address.street_address()+', '+Faker::Address.city,
                        start: Faker::Date.between(from: 2.year.ago, to: 500.day.ago),
                        end: Faker::Date.between(from: 400.day.ago, to: 1.day.ago),
                        min_price: Faker::Number.between(from: 1, to: 2500), max_price: Faker::Number.between(from: 2500, to: 5000), 
                        pet: ['Dog', 'Cat', 'No'].sample, 
                        user_id: User.all.sample.id)
end
p "Created #{Preference.count} preference tables"