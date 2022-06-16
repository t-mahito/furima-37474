FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.free_email}
    nickname              {Faker::Name.initials(number: 2)}
    first_name_kanji      {"山田"}
    last_name_kanji       {"一郎"}
    first_name_kana       {"ヤマダ"}
    last_name_kana        {"イチロウ"}
    birthday              {"2000-10-6"}
    password              {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
  end
end
