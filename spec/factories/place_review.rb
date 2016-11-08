require 'faker'


def generate_mark
  (rand * 5).round(1)
end

def generate_address
  address_entries = [Faker::Address.city,Faker::Address.street_name,Faker::Address.building_number, Faker::Address.secondary_address]
  address_entries.join ', '
end

FactoryGirl.define do
  factory :place_review do
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
