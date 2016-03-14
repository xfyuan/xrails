# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  pwd = FFaker::Internet.password
  User.create!({
    email: FFaker::Internet.email,
    password: pwd,
    password_confirmation: pwd,
    firstname: FFaker::Name.first_name,
    lastname: FFaker::Name.last_name,
    authentication_token: FFaker::Internet.password,
    info: '{}'
  })
end
