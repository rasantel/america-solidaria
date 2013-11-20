namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "admin@example.org",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)
    User.create!(name: "Sean Fitzgerald",
                 email: "fitzgerald.sean.t@gmail.com",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: false)
    User.create!(name: "Sirui Lu",
                 email: "slu@nd.edu",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: false)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end
