class OrderAddres
  
  include ActiveModel::Model 
  attr_accessor :user_id, :item_id, :postcode, :area_id, :city, :block, :building, :phone_number, :token

  with_options presence: true do
    validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :area_id, numericality: { other_than:1 }
    validates :city
    validates :block
    validates :phone_number, length: { maximum: 11 }, numericality: { only_integer: true }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, area_id: area_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
end