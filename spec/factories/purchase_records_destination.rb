FactoryBot.define do
  factory :purchase_records_destination do
    post_code  {"123-4567"}
    shipping_area_id {2}
    phone_number {"09012345678"}
    city { "横浜市緑区"}
    address {"青山1-1-1"}
    building_name {"ポレポレ"}
    
  end
end
