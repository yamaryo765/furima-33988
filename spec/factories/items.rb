FactoryBot.define do
  factory :item do
    name {"test"}
    price {"5000"}
    description  {"商品の説明"}
    shipping_area_id {2}
    shipping_cost_id {2}
    shipping_day_id  {2}
    category_id {2}
    status_id {2}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('./app/assets/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
