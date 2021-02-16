class Destination < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :post_code, :shipping_area_id, :city, :address, :building_name, :phone_number, :item_id, :token, :user_id

  with_options presence: true do
    validates :token
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid."}
    validates :user_id
    validates :item_id
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  

  def save
    phacase_record = PhacaseRecord.create(user_id: user_id, item_id: item_id)
    Destination.create(post_code: post_code,  shipping_area_id: shipping_area_id, city: city, address: address,  phone_number: phone_number, purchase_records: purchase_records_id)

    
  end
end
