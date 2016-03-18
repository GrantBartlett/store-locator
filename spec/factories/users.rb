FactoryGirl.define do
  # This will use the User class (Admin would have been guessed)
  factory :user, class: User do
    first "admin"
    email "admin@example.com"
    admin  true
  end
end
