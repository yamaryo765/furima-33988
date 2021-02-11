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
      validates :price
      validates :category_id, numericality: { other_than: 1 } 
      validates :status_id, numericality: { other_than: 1 } 
      validates :shipping_cost_id, numericality: { other_than: 1 } 
      validates :shipping_area_id, numericality: { other_than: 1 } 
      validates :shipping_day_id, numericality: { other_than: 1 }
    end
  
  

   
end