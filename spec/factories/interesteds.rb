FactoryBot.define do
  factory :interested do
    association :user
    association :item
  end
end
