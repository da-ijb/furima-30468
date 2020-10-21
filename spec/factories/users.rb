FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    birth_date            { Faker::Date.backward } 
    last_name             { person.last.kanji }
    first_name            { person.first.kanji }
    furigana_last_name    { person.last.katakana }
    furigana_first_name   { person.first.katakana }
  end
end