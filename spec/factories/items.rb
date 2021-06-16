FactoryBot.define do
  factory :item do
    item_name     {Faker::Commerce.product_name}
    price         {Faker::Number.between(from: 300, to: 9999999)}
    details       {Faker::Lorem.sentence}
    status_id     {Faker::Number.between(from: 1, to: 6)}
    postage_id    {Faker::Number.between(from: 1, to: 2)}
    area_id       {Faker::Number.between(from: 1, to: 47)}
    day_id        {Faker::Number.between(from: 1, to: 3)}
    category_id   {Faker::Number.between(from: 1, to: 10)}
    

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/free.jpeg'), filename: 'free.jpeg')
    end
  end
end
