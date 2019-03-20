FactoryGirl.define do
  factory :user do
    name  { Faker::User.name }
    email { Faker::User.email }
    company  
  end
end
