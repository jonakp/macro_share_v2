FactoryBot.define do
  factory :foodhistory do
    name { "rice" }
    calorie { "test" }
    mode { "pri" }
    association :user
  end
end
