# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require 'faker'

# Create an Admin User
User.create!(name: 'Admin', email: 'admin@example.com', password: 'password', password_confirmation: 'password')

# Create Users
users = []
rand(10..20).times do
  users << User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    password: 'password',
    password_confirmation: 'password'
  )
end

# Create Courses
courses = []
rand(20..100).times do
  courses << Course.create!(
    title: Faker::Educator.course_name,
    description: Faker::Lorem.paragraph,
    price: Faker::Commerce.price(range: 0..100.0)
  )
end

# Create Enrollments, Lessons, and Discussions
courses.each do |course|
  # Create Enrollments
  rand(20..50).times do
    Enrollment.create!(
      user: users.sample,
      course: course
    )
  end

  # Create Lessons
  lessons = []
  rand(12..27).times do
    lessons << Lesson.create!(
      title: Faker::Educator.subject,
      content: Faker::Lorem.paragraph,
      course: course
    )
  end

  # Create Discussions
  lessons.each do |lesson|
    rand(10..25).times do
      Discussion.create!(
        content: Faker::Lorem.sentence,
        user: users.sample,
        lesson: lesson
      )
    end
  end
end

puts "Seed data created successfully!"
