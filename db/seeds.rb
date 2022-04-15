# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def seed_users
  user_id = 0
  10.times do 
    User.create(
      name: "test#{user_id}",
      email: "test#{user_id}@test.com",
      password: '123456',
      password_confirmation: '123456'
    )
    user_id = user_id + 1
  end
end


def seed_projects
  project = {Arts:'About Arts and Humanities', Science: 'About Physical Science and Engineering', Maths: 'About Math and Logic',
          Computer: 'About Computer Science', Data: 'About Data Science', Economics: 'About Economics and Finance', Business: 'About Business',
          Social: 'About Social Sciences'}

  project.each do |key, value|
    Project.create(name: "#{key}", description: "#{value}", user_id: rand(1..9))
  end
end

def seed_tasks
  projects = Project.all

  projects.each do |project|
    5.times do
      Task.create(
        title: Faker::Lorem.sentences[0], 
        content: Faker::Lorem.sentences[0], 
        user_id: rand(1..9), 
        project_id: project.id
      )
    end
  end
end

# seed_users
seed_projects
# seed_tasks
