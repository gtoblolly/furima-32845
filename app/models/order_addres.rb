class order_addres
  
  include ActiveModel::module 
  attr_accessor :user_id, :item_id, :postcode, :shipping_id, :city, :block, :building, :phone_number, :order_id

  with_options presence: true do
    validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :shipping_id, numericality: { other_than:1 }
    validates :city
    validates :block
    validates :phone_number, { with: /\A\d{10,11}\z/}
    validates :order
  end

  def save
    Order.create(user_id: user.id, item_id: item.id)
    Address.create(postcode: postcode, shipping_id: shipping_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
end