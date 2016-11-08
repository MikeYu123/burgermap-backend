# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.development?
  FactoryGirl.create_list(:user, 3)
  User.create(email: 'mikesehse@gmail.com',
              uid: 'mikesehse@gmail.com',
              provider: 'email',
              password: '11111111',
              password_confirmation: '11111111',
              name: 'Mike Yurchenkov',
              nickname: 'mikeyu1234',
              image: 'https://avatarko.ru/img/avatar/14/drakon_13064.jpg')
  FactoryGirl.create_list(:place_review, 10)
end
