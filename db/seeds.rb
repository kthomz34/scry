# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Create Users
5.times do
  User.create!(
  # name:     Faker::Name.name,
  email:    Faker::Internet.email,
  password: Faker::Lorem.sentence
  )
end
users = User.all

# Create Registered Applications
 

15.times do
  app = Faker::App.name 
  RegisteredApplication.create!(
    user: users.sample,
    name: app,
    url:  "www.#{app.gsub(/\s+/, "").downcase}.com"
  )
end
registered_applications = RegisteredApplication.all

# Create Users
user = User.first
  user.update_attributes!(
  email: 'kurt.thomas34@gmail.com', 
  password: 'testtest',
  # confirmed_at: Date.today,
  # role: 'premium'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{RegisteredApplication.count} Registered Applications created"
