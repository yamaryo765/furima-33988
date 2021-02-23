class PurchaseRecordsDestination 
  include ActiveModel::Model
  attr_accessor  :user_id,:item_id,:post_code,:shipping_area_id,:phone_number,:city,:address,:building_name,:token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "にはハイフン（-)を含む必要があります"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ , message: "には全角文字を使用してください"}
    validates :address
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "が登録できません"}
    validates :user_id 
    validates :item_id
    validates :shipping_area_id, numericality: { other_than: 0, message: "を入力してください" }
    validates :token 
  end
  def save
      purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
      Destination.create(post_code: post_code,  shipping_area_id: shipping_area_id, city: city, address: address,building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end 
end