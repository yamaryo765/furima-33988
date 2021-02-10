class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :price
    validates :description
    validates :user,      foreign_key: true
  end


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