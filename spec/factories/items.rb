FactoryBot.define do
  factory :item do
    title { "サンプル商品" }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/sample.jpg'), 'image/jpeg') }
    price { 1000 }
    category { "ホビー" }
    onSale { true }
    interest { 0 }
    association :user
  end
end
