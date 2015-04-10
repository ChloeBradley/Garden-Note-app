namespace :user do
desc 'Refreshes the user table with 50 new users'
  task :create => :environment do
    require 'faker'

    User.destroy_all
    Garden.destroy_all
    Note.destroy_all

    30.times do |user|
      User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password")
    end
    puts "#{User.count} users created"
    user_id_array = User.pluck(:id)

    season_array = ['Indoor Herb Garden 2014', 'Summer Vegetable Garden 2012', 'Winter Green House Experiment 2015', 'Fall Mulching 2013', 'Lasagna Garden Ideas 2016', 'Garden Ideas']
    plant_type_array = ['vegetable', 'herb', 'flowers', 'fruits']

    400.times do |garden|
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
