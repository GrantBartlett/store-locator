FactoryGirl.define do
  # params.require(:brand).permit(:title, :logo, :url, :description, :published)
  factory :brand, class: Brand do
    title Faker::Company.name
    logo Faker::Company.logo
    url Faker::Company.name
    description Faker::Company.catch_phrase
    published false
  end
end
