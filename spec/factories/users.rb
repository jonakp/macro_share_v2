FactoryBot.define do
  factory :user do
    name { "test" }
    sequence(:email) { |n| "test#{n}@me.com" }
    gender { "male" }
    password { "123456" }
  end
end
