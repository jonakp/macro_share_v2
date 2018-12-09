FactoryBot.define do
  factory :like do
    association :user
    association :foodhistory
  end
end
