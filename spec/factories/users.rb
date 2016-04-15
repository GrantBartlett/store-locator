FactoryGirl.define do
  factory :admin, class: User do
    name Faker::Name.name
    email Faker::Internet.email
    admin true
    password_digest User.digest('password')
  end

  factory :user, class: User do
    name Faker::Name.name
    email Faker::Internet.email
    admin false
    password_digest User.digest('password')
  end
end
