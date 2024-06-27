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

User.create!(name: 'Admin', email: 'admin@example.com', password: 'password', password_confirmation: 'password')

10.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password'
  )
  
  course = Course.create!(
    title: Faker::Educator.course_name,
    description: Faker::Lorem.paragraph,
    price: Faker::Commerce.price(range: 0..100.0)
  )
  
  Enrollment.create!(user: user, course: course)
  
  lesson = Lesson.create!(
    title: Faker::Educator.subject,
    content: Faker::Lorem.paragraph,
    course: course
  )
  
  Discussion.create!(
    content: Faker::Lorem.sentence,
    user: user,
    lesson: lesson
  )
end
