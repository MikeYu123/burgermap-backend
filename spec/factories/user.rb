FactoryGirl.define do
  factory :user do
    title { Faker::Company.name }
    short_description { Faker::Lorem.sentence }
    image { Faker::Avatar.image }
    lat {Faker::Address.latitude}
    lng {Faker::Address.longitude}
    description { Faker::Lorem.paragraph }
    mark { generate_mark }
    link { Faker::Internet.url }
    user
    address {generate_address}
  end
end
