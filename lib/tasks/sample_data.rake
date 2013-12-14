namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(email: "example@railstutorial.org",
                         password: "foobar",
                         password_confirmation: "foobar")
    admin.toggle!(:admin)
    
    99.times do |n|
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(email: email,
                   password: password,
                   password_confirmation: password)
    
    10.times do
      title = Faker::Lorem.sentence(5)
      content = Faker::Lorem.sentence(5)
      image = Faker::Lorem.sentence(5)
      admin.trips.create!(title: title, content: content, image: image)
    end
    end
    end
end