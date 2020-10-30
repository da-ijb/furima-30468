FactoryBot.define do
  factory :order_form do
    transient do
      person { Gimei.name }
    end
  postal_code   { '123-4567' }
  prefecture_id { 2 }
  municipality  { '大阪市北区' }
  address       { '大阪1-1-1' }
  building_name { '大阪ビル303' }
  phone_number  { Faker::Number.number }
  token {"tok_abcdefghijk00000000000000000"}
  end
end    