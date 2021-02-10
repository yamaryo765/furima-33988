class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  
    validates :name,null: false
    validates :price,null: false
    validates :description, null: false
    validates :user,   null: false
  


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :shipping_cost
  belongs_to :shipping_area
  belongs_to :status

  validates :category_id, numericality: { other_than: 1 } 
  validates :status_id, numericality: { other_than: 1 } 
  validates :shipping_codt_id, numericality: { other_than: 1 } 
  validates :shipping_area_id, numericality: { other_than: 1 } 
  validates :shipping_day_id, numericality: { other_than: 1 } 
end