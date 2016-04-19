FactoryGirl.define do
  factory :brand, class: Brand do
    title Faker::Company.name
    logo Faker::Company.logo
    url Faker::Company.name
    description Faker::Company.catch_phrase
    published false

    # factory :brand_with_location do
    #   after(:create) do |brand|
    #     create(:location, brand: brand)
    #   end
    # end
  end
end

FactoryGirl.define do
  factory :location, class: Location do
    name Faker::Company.name
    lat Faker::Company.logo
    lng Faker::Company.name
    content Faker::Company.catch_phrase
    url Faker::Company.name
  end
end
