FactoryGirl.define do
  app = Faker::App.name
  
  factory :registered_application do
    name app
    url "www#{app}.com"
  end
end
