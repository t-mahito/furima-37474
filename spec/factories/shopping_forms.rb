FactoryBot.define do
  factory :shopping_form do
    postal_code    {"012-3456"}
    area_id        {2}
    city           {"テスト"}
    address        {"テスト"}
    building_name  {"テスト"}
    phone_number   {"0123456789"}
    token          {Faker::Internet.password(min_length: 20)}

  end
end
