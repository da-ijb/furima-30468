FactoryBot.define do
  factory :item do
    transient do
      person { Gimei.name }
    end
   name                 { Faker::Name.name }
   description          { Faker::Lorem.sentence }
   categories_id        { 2 }
   states_id            { 2 }
   delivery_charges_id  { 2 }
   shipment_sources_id  { 2 }
   days_to_ships_id     { 2 }
   price                { Faker::Number.number}
   association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end   
  end
end
