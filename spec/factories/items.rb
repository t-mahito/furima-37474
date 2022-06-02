FactoryBot.define do
  factory :item do
   trait :a do
    name         {"test"}
    text         {"テスト出品です。"}
    category_id  {2}
    condition_id {2}
    charge_id    {2}
    area_id      {2}
    delivery_id  {2}
    price        {1000}
    user

    after(:build) do |i|
      i.image.attach(io: File.open("spec/image/test.jpg"), filename: "test.jpg", content_type: "jpg") 
    end
   end
  end

  
  trait :b do
    name         {"test"}
    text         {"テスト出品です。"}
    category_id  {2}
    condition_id {2}
    charge_id    {2}
    area_id      {2}
    delivery_id  {2}
    price        {1000}
    user
  end

  trait :c do
    name         {"test"}
    text         {"テスト出品です。"}
    category_id  {2}
    condition_id {2}
    charge_id    {2}
    area_id      {2}
    delivery_id  {2}
    price        {1000}

    after(:build) do |i|
      i.image.attach(io: File.open("spec/image/test.jpg"), filename: "test.jpg", content_type: "jpg") 
    end
  end
end

