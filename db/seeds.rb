5.times do |n|
  User.create!(
    id: n,
    name: "ユーザー#{n}",
    email: "user#{n}@mail.com",
    password: "password#{n}",
    introduction: "テストです",
    likes: 0
  )
end

15.times do |n|
  Item.create!(
    id: n,
    image: File.open(Rails.root.join("db/seed_images/sample.jpg")),
    title: "アイテム#{n}",
    price: 1000 + n,
    category: "ホビー",
    introduction: "テストです",
    onSale: true,
    interest: n,
    deliveryStatus: false,
    user_id: 1
  )
end
15.times do |n|
  Item.create!(
    id: n+15,
    image: File.open(Rails.root.join("db/seed_images/sample2.jpg")),
    title: "すごいアイテム#{n}",
    price: 10000 + n,
    category: "ゲーム",
    introduction: "テストです2",
    onSale: true,
    interest: n + 10,
    deliveryStatus: false,
    user_id: 2
  )
end

10.times do |n|
  Purchase.create!(
    id: n,
    arrived: false,
    rate: 0,
    user_id: 3,
    item_id: n
  )
end
