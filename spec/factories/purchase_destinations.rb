FactoryBot.define do
  factory :purchase_destination do
    postcode { '123-4567' }
    prefecture_id { 14 }
    city { '名古屋市千種区' }
    block { '唐山町2-35' }
    building { '唐山ハイツ' }
    phone_number { '09012345678' }
  end
end
