require 'faker'

MAX_USERS = 5

([0, (MAX_USERS - User.count)].max).times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
end

puts "Seed finished"
puts "#{User.count} users created"