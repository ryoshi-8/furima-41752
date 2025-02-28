FactoryBot.define do
  factory :item do
    product_name       { '折り紙のバラ' }
    description        { Faker::Lorem.sentence }
    category_id        { '2' }
    condition_id       { '2' }
    ship_fee_burden_id { '2' }
    prefecture_id      { '2' }
    days_until_ship_id { '2' }
    price              { '1000' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
