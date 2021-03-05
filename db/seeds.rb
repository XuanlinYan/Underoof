User.delete_all
Condition.delete_all
Preference.delete_all

50.times do |index|
    Preference.create!(location: Faker::Address.street_address()+', '+Faker::Address.city,
                  start: Faker::Date.between(from: 2.year.ago, to: 500.day.ago),
                    end: Faker::Date.between(from: 400.day.ago, to: 1.day.ago))
end

p "Created #{Preference.count} preference tables"

50.times do |index|
    Condition.create!(location: Faker::Address.street_address()+', '+Faker::Address.city,
                  start: Faker::Date.between(from: 2.year.ago, to: 500.day.ago),
                    end: Faker::Date.between(from: 400.day.ago, to: 1.day.ago))
end

p "Created #{Condition.count} condition tables"

100.times do |index|
    User.create!(name: Faker::Name.unique.name,
                  password: Faker::Internet.password(min_length: 8),
                  email: Faker::Internet.email,
                  gender: ['Female', 'Male'].sample,
                  preference_id: Preference.all.sample.id,
                  condition_id: Condition.all.sample.id)
end
p "Created #{User.count} users"