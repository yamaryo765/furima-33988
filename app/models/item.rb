class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image

    belongs_to :category
    belongs_to :shipping_cost
    belongs_to  :shipping_area
    belongs_to :shipping_day
    belongs_to :status

    with_options presence: true do
      validates :image
      validates :name
      validates :description
      validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 } 
      validates :category_id, numericality: { other_than: 0 } 
      validates :status_id, numericality: { other_than: 0 } 
      validates :shipping_cost_id, numericality: { other_than: 0 } 
      validates :shipping_area_id, numericality: { other_than: 0 } 
      validates :shipping_day_id, numericality: { other_than: 0 }
    end
end