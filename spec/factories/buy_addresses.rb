FactoryBot.define do
  factory :buy_address do
    token         {'tok_abcdefghijk0000000000000000'}
    postal_code   { '123-4567' }
    prefecture_id {Faker::Number.between(from: 1, to: 47)}
    municipality  { '東京都' }
    address       { '1-1' }
    phone_number  { '09055553333' }
    building_name { '柳ビル'}
  end
end
