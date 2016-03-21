FactoryGirl.define do
  factory :admin, class: User do
    name Faker::Name.name
    email Faker::Internet.email
    admin true
    password User.digest('password')
  end
end
