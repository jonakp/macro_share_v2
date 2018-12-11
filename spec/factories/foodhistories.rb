FactoryBot.define do
  factory :foodhistory do
    name { "rice" }
    calorie { "123" }
    mode { "pri" }
    user
  end
end
