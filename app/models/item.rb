class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :ship_fee_burden
  belongs_to :prefecture
  belongs_to :days_until_ship

  with_options presence: true do
    validates :product_name
    validates :description
    validates :price
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :ship_fee_burden_id
    validates :prefecture_id
    validates :days_until_ship_id
  end
end
