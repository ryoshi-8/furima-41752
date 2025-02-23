FactoryBot.define do
  factory :user do
    nickname              { 'tegetege' }
    email                 { Faker::Internet.email }
    password              { '123qwe' }
    password_confirmation { password }
    family_name           { '東' }
    first_name            { 'あきら' }
    family_name_kana      { 'ヒガシ' }
    first_name_kana       { 'アキラ' }
    birthday              { '1980/1/1' }
  end
end
