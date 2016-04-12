FactoryGirl.define do
  # params[:location].permit([:name, :lat, :lng, :content, :url])
  factory :location, class: Location do
    name Faker::Company.name
    lat Faker::Address.latitude
    lng Faker::Address.longitude
    content Faker::Company.catch_phrase
    url Faker::Address.latitude
  end
end
