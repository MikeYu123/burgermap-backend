def sample_provider
  providers = ['google', 'facebook', 'vk', 'email']
  providers.sample
end

FactoryGirl.define do
  factory :user do
    transient do
      sample_password {Faker::Internet.password(8)}
      sample_email {Faker::Internet.email}
    end
    provider 'email'
    uid {sample_email}
    name { Faker::Name.name }
    nickname { Faker::Hipster.word }
    image { Faker::Avatar.image }
    email {sample_email}
    password {sample_password}
    password_confirmation {sample_password}
  end
end
