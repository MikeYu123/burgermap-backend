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
    trait :with_title do
      title { Faker::Company.name }
    end
    short_description { Faker::Lorem.sentence }
    image { Faker::Avatar.image }

    trait :with_coords do
      lat {Faker::Address.latitude}
      lng {Faker::Address.longitude}
    end

    description { Faker::Lorem.paragraph }

    trait :with_mark do
      mark { generate_mark }
    end

    link { Faker::Internet.url }
    address {generate_address}
    user

    factory :place_without_title,    traits: [:with_coords, :with_mark]
    factory :place_without_coords,   traits: [:with_title, :with_mark]
    factory :place_without_mark,  traits: [:with_coords, :with_title]
    factory :valid_place, traits: [:with_coords, :with_title, :with_mark]
  end
end
