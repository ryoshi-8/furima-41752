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
    validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :ship_fee_burden_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :days_until_ship_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :price,
              numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000,
                              message: '300から9999999の間の半角数値を使用してください' }
  end
end
