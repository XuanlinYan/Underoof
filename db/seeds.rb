# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Condition.destroy_all
Preference.destroy_all

100.times do |index|
    User.create!(name: Faker::Name.name,
                  password: Faker::Name.name,
                  email: Faker::Internet.email,
                  gender: ['Female', 'Male'].sample)
end

p "Created #{User.count} users"

100.times do |index|
    Condition.create!(location: Faker::Address.street_address()+', '+Faker::Address.city,
                  start: Faker::Date.between(from: 2.year.ago, to: 500.day.ago),
                    end: Faker::Date.between(from: 400.day.ago, to: 1.day.ago),
                userid: User.all.sample.id)
end

p "Created #{Condition.count} condition tables"

100.times do |index|
    Preference.create!(location: Faker::Address.street_address()+', '+Faker::Address.city,
                  start: Faker::Date.between(from: 2.year.ago, to: 500.day.ago),
                    end: Faker::Date.between(from: 400.day.ago, to: 1.day.ago),
                userid: User.all.sample.id)
end

p "Created #{Preference.count} preference tables"
