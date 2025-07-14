FactoryBot.define do
  factory :purchase do
    arrived { false}
    rate { 0 }
    association :user
    association :item
  end
end
