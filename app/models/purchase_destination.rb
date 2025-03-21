class PurchaseDestination
  include ActiveModel::Model
  attr_accessor :token, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :user_id, :item_id, :purchase_id

  with_options presence: true do
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid.' }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A[0-9]{10,11}+\z/, message: 'is invalid.' }
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Destination.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block,
                       building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
