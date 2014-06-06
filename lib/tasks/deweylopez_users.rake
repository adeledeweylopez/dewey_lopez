namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
  	alex = User.create!(name: "Alex Dewey-Lopez",
                         email: "sharkyminimalist@gmail.com",
                         password: "foobar",
                         password_confirmation: "foobar",
                         admin: true,
                         user_alias: "alex")

    adele = User.create!(name: "Adele Dewey-Lopez",
                         email: "adeletlopez@gmail.com",
                         password: "foobar",
                         password_confirmation: "foobar",
                         admin: true,
                         user_alias: "adele")
  end
end
