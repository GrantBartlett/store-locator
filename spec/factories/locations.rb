FactoryGirl.define do
  factory :location do
    name Faker::Company.name
    lat Faker::Company.logo
    lng Faker::Company.name
    content Faker::Company.catch_phrase
    url Faker::Company.name
  end
end
