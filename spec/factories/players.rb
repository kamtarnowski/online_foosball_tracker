FactoryGirl.define do
  factory :player do
    last_name Faker::Name.last_name
    first_name Faker::Name.first_name
    avatar Rack::Test::UploadedFile.new(Rails.root+'spec/support/football.jpg', 'image/jpg')
  end
end
