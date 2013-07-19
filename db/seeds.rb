# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

User.destroy_all
Project.destroy_all

# goals = Array.new

# 99.times do
# 	goals << Random.rand(100..99999)
# end

# u = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password")
# 3.times do 
# 	u.projects.create(title: Faker::Name.title, teaser: Faker::Lorem.sentence(15), description: Faker::Lorem.sentences(8), goal: goals.sample)
# end
user = User.create!(first_name: "John", last_name: "Doe", email: "john@doe.com", password: "password")

50.times do |i|
  project1 = user.projects.create!(title: "Project #{i}", teaser: "Teaser text #{i}", description: "description #{i}", goal: 13000)
end

