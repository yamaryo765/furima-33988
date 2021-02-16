class PhacaseRecord < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :user,:item

  with_options presence: true do
    validates :user
    validates :item
  end
  def save
    user =  User.create(nickname: nickname, email: email, password: password, first_name: first_name, family_name: family_name, first_name_kana: first_name_kana, family_name_kana: family_name_kana, birth_day: birth_day)
    Item.create(name: name, description: description, category_id: category_id, status_id: status_id, shipping_area_id: shipping_area_id, shipping_cost_id: shipping_cost.id, shipping_day.id: shipping_day.id, price: price, user_id: user.id)
  end
end
