FactoryGirl.define do
  event_name = Faker::Hipster.word
  
  factory :event do
    name event_name
  end
end
