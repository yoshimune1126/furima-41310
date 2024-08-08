class OrderForm
  include ActiveModel::Model
  attr_accessor :phone_number, :postal_code, :address, :city, :building_name, :prefecture_id, :user_id, :item_id, :token, :order_id

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input only number' }
  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }

  validates :address, presence: true
  validates :city, presence: true
  validates :token, presence: true


  validates :user_id, presence: true
  validates :item_id, presence: true




  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(order_id: order.id, postal_code: postal_code, address: address, city: city, building_name: building_name, prefecture_id: prefecture_id, phone_number: phone_number)
  end


end