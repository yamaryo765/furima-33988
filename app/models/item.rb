class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  has_one :purchase_record

    belongs_to :category
    belongs_to :shipping_cost
    belongs_to  :shipping_area
    belongs_to :shipping_day
    belongs_to :status

    with_options presence: true,numericality: { other_than: 0 } do 
      validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 } ,format:{with: /\A[0-9]+\z/}
      validates :category_id 
      validates :status_id
      validates :shipping_cost_id 
      validates :shipping_area_id
      validates :shipping_day_id
    end
    with_options presence: true do
        validates :image
        validates :name
        validates :description
    end
end