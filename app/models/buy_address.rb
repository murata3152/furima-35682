class BuyAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :municipality, :address, :phone_number, :building_name, :prefecture_id, :user_id, :item_id, :token
  

  with_options presence: true do
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :address
    validates :user_id
    validates :item_id
    validates :phone_number, format: {with: /\A0[9]0\d{8}\z/, message: "can't be blank"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
  end

  def save
    buy = Buy.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, municipality: municipality, address: address, phone_number: phone_number, building_name: building_name, prefecture_id: prefecture_id, buy_id: buy.id)
  end
end