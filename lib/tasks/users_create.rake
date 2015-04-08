namespace :user do
desc 'Refreshes the user table with 50 new users'
  task :create => :environment do
    require 'faker'

    User.destroy_all
    Garden.destroy_all
    Note.destroy_all

    10.times do |user|
      User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password")
    end
    puts "#{User.count} users created"
    user_id_array = User.pluck(:id)

    season_array = ['Spring 2010', 'Summer 29837', 'Winter 2015', 'Fall 2345']
    plant_type_array = ['vegetable', 'herb', 'flowers', 'fruits']

    20.times do |garden|
      Garden.create!(season_name: season_array.sample, plant_type: plant_type_array.sample, user_id: user_id_array.sample)
    end
    puts "#{Garden.count} gardens created"
    garden_id_array = Garden.pluck(:id)

    25.times do |note|
      Note.create!(title: Faker::Hacker.adjective, note: Faker::Hacker.say_something_smart, date: Faker::Date.forward(30), garden_id: garden_id_array.sample)
    end
    puts "#{Note.count} notes created"

  end
end
