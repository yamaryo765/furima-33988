FactoryBot.define do
  factory :user do
    nickname              {"山口凌平"}
    email                 {"sample@gmail.com"}
    password              {"test123"}   
    password_confirmation {"test123"}
    family_name           {"山口"}
    family_name_kana      {"ヤマグチ"}
    first_name            {"凌平"}
    first_name_kana       {"リョウヘイ"}
    birth_day             {"1997-07-13"}
  end
end